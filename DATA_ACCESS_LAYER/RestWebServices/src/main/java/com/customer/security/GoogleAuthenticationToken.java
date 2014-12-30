package com.customer.security;

import org.apache.shiro.authc.UsernamePasswordToken;

public class GoogleAuthenticationToken extends UsernamePasswordToken  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4088455399833047846L;
	private String googleToken;
	
	public GoogleAuthenticationToken(){}

	public String getGoogleToken() {
		return googleToken;
	}

	public void setGoogleToken(String googleToken) {
		this.googleToken = googleToken;
	}
	
	

}
