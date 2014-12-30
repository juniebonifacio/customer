package com.customer.security;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

public class ExtendedSimpleCredentialsMatcher extends SimpleCredentialsMatcher  {

	
	public ExtendedSimpleCredentialsMatcher() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token,
			AuthenticationInfo info) {
		if(token instanceof GoogleAuthenticationToken){
			return true;
		}
		return super.doCredentialsMatch(token, info);
	}
}
