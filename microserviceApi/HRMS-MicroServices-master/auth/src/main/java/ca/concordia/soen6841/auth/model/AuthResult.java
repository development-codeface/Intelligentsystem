package ca.concordia.soen6841.auth.model;

public class AuthResult{
	private String token = "";
	private Employee userDetail;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Employee getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(Employee userDetail) {
		this.userDetail = userDetail;
	}
	
	
	

}
