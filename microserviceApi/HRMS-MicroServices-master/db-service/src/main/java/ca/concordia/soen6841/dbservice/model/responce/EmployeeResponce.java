package ca.concordia.soen6841.dbservice.model.responce;

import javax.persistence.Column;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class EmployeeResponce {
    private String username;

    private String email;
    
    private Long id;
    
    public EmployeeResponce(String username, String email, Long id) {
    	this.username = username;
    	this.email    = email;
    	this.id       = id;
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
