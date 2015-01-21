package com.customer.security;

import java.io.Serializable;
import java.security.Principal;

public class UserPrincipal implements Principal, Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 935810125605482052L;
	private String id;
	private String email;
	private String client_id;
	private String sec_user_id;
	
	public UserPrincipal(String id, String email, String client_id, String sec_user_id){
		this.id = id;
		this.email = email;
		this.client_id = client_id;
		this.sec_user_id = sec_user_id;
	}
	
	public String getName() {
		return email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
