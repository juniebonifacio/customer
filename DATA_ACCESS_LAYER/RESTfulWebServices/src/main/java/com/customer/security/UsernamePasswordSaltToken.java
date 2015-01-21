package com.customer.security;

public class UsernamePasswordSaltToken  {

	private String salt;
	private String username;
	private String password;
	private String userId;
	private String client_id;
	private String sec_user_id;
	
	public UsernamePasswordSaltToken(String userId, String username, String password, String salt, String client_id, String sec_user_id){
		this.salt = salt;
		this.username = username;
		this.password = password;
		this.userId = userId;
		this.client_id = client_id;
		this.sec_user_id = sec_user_id;
	}
	
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getSec_user_id() {
		return sec_user_id;
	}

	public void setSec_user_id(String sec_user_id) {
		this.sec_user_id = sec_user_id;
	}
	
}
