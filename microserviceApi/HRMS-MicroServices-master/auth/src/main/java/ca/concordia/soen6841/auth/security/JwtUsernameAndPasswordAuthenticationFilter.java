package ca.concordia.soen6841.auth.security;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ca.concordia.soen6841.auth.model.AuthResult;
import ca.concordia.soen6841.auth.model.Employee;
import ca.concordia.soen6841.auth.model.Role;
import ca.concordia.soen6841.auth.repository.EmployeeRepository;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class JwtUsernameAndPasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter   {

    // We use auth manager to validate the user credentials
    private AuthenticationManager authManager;

    private final JwtConfig jwtConfig;
    
    static final String ORIGIN = "Origin";
    
    private EmployeeRepository employeRepo;

    public JwtUsernameAndPasswordAuthenticationFilter(AuthenticationManager authManager, JwtConfig jwtConfig, EmployeeRepository repo) {
        this.authManager = authManager;
        this.jwtConfig = jwtConfig;
        this.employeRepo = repo;    
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException {
    	
    	
    	
        
        try {

            // 1. Get credentials from request
            UserCredentials creds = new ObjectMapper().readValue(request.getInputStream(), UserCredentials.class);

            // 2. Create auth object (contains credentials) which will be used by auth manager
            UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
                    creds.getUsername(), creds.getPassword(), Collections.emptyList());

            // 3. Authentication manager authenticate the user, and use UserDetialsServiceImpl::loadUserByUsername() method to load the user.
            return authManager.authenticate(authToken);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // Upon successful authentication, generate a token.
    // The 'auth' passed to successfulAuthentication() is the current authenticated user.
    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
                                            Authentication auth) throws IOException, ServletException {

        Long now = System.currentTimeMillis();
        String token = Jwts.builder()
                .setSubject(auth.getName())
                // Convert to list of strings.
                // This is important because it affects the way we get them back in the Gateway.
                .claim("authorities", auth.getAuthorities().stream()
                        .map(GrantedAuthority::getAuthority).collect(Collectors.toList()))
                .setIssuedAt(new Date(now))
                .setExpiration(new Date(now + jwtConfig.getExpiration() * 1000))  // in milliseconds
                .signWith(SignatureAlgorithm.HS512, jwtConfig.getSecret().getBytes())
                .compact();
        if (request.getHeader(ORIGIN) != null) {
            String origin = request.getHeader(ORIGIN);
            response.addHeader("Access-Control-Allow-Origin", origin);
            response.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
            response.addHeader("Access-Control-Allow-Credentials", "true");
            response.addHeader("Access-Control-Allow-Headers",
                    request.getHeader("Access-Control-Request-Headers"));
        }
        // Add token to header
        response.addHeader(jwtConfig.getHeader(), jwtConfig.getPrefix() + token);
        Optional<Employee>  employee = employeRepo.findByUsername(auth.getName());
        
        employee.ifPresent(user -> {
            try {
            	ObjectMapper mapper = new ObjectMapper();
            	AuthResult result = new AuthResult();
            	System.out.println("<<<<<"+user.getRoles().size());
            	user.setRoles(getRole(user.getRoles()));
            	result.setUserDetail(user);        	
            	result.setToken(token);
            	try {
            		  String resultJson = mapper.writeValueAsString(result);
            		  response.getWriter().write(resultJson);
            		  //System.out.println(json);
            		} catch (JsonProcessingException e) {
            		   e.printStackTrace();
            		}
            	
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        });
        //response.getWriter().write("{toke:'"+token+"'}");
    }
    
    private Set<Role> getRole(Set<Role> rolevals) {
    	Set<Role> roleList = new HashSet<>();
    	for(Role role : rolevals) {
    		Role roleItem = new Role();
    		roleItem.setName(role.getName());
    		roleItem.Long(role.getId());
    		roleList.add(roleItem);
    	}
    	
    	return roleList; 
    }

    // A (temporary) class just to represent the user credentials
    private static class UserCredentials {
        private String username, password;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }
    }
}