/*
 * Copyright (c) 2013  customer Global Limited
 * All rights reserved. No part of this code or any of its contents may be reproduced, copied, modified or adapted.
 */
package com.customer.security;

import java.util.Enumeration;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.AbstractRememberMeManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.SubjectContext;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.subject.WebSubjectContext;
import org.apache.shiro.web.util.WebUtils;

public class RememberMeManager extends AbstractRememberMeManager {

	private static final Logger logger = Logger.getLogger(RememberMeManager.class);

	private static final String LOGGED_IN_USER = "loggedInUser";

	public void forgetIdentity(SubjectContext subjectContext) {
		logger.debug("Forget Identity: Subject Context: "
				+ subjectContext);
		if (WebUtils.isHttp(subjectContext)) {
			HttpServletRequest request = WebUtils
					.getHttpRequest(subjectContext);
			HttpServletResponse response = WebUtils
					.getHttpResponse(subjectContext);
			forgetIdentity(request, response);
		}

	}

	private void forgetIdentity(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		response.setHeader(LOGGED_IN_USER,"");
		
	}

	@Override
	protected void forgetIdentity(Subject subject) {
		// TODO Auto-generated method stub
		logger.debug("==================================  Forget Identity: Subject" + subject);
		if (WebUtils.isHttp(subject)) {
			HttpServletRequest request = WebUtils.getHttpRequest(subject);
			HttpServletResponse response = WebUtils.getHttpResponse(subject);
			forgetIdentity(request, response);
		}

	}

	@Override
	protected void rememberSerializedIdentity(Subject subject, byte[] serialized) {
		// TODO Auto-generated method stub
		logger.debug("RememberSerialized " + subject);
		HttpServletRequest request = WebUtils.getHttpRequest(subject);
		HttpServletResponse response = WebUtils.getHttpResponse(subject);
		
		logger.debug("Current user " + subject.getPrincipal());
		String base64 = Base64.encodeToString(serialized);
		response.setHeader(LOGGED_IN_USER, base64);
	}

	@Override
	protected byte[] getRememberedSerializedIdentity(
			SubjectContext subjectContext) {
		// TODO Auto-generated method stub
		logger.debug("getRememberedSerialized: " + subjectContext);
		
		if(subjectContext instanceof WebSubjectContext){
		WebSubjectContext wsc = (WebSubjectContext) subjectContext;
		if (isIdentityRemoved(wsc)) {
			return null;
		}

		HttpServletRequest request = WebUtils.getHttpRequest(wsc);
		HttpServletResponse response = WebUtils.getHttpResponse(wsc);
		for(Enumeration<String> en = request.getHeaderNames(); en.hasMoreElements(); ){
			String header =  en.nextElement();
			logger.debug("header: " + header + " = " + request.getHeader(header));
		}
		//System.err.println("Cookies " + request.getHeader("cookie"));
				
		String thisHeader = request.getHeader("cookie");
        String delStr = "loggedInUser=";
        String newStr = null;
        if(thisHeader!=null){
	        String findMe = "loggedInUser=";
	        int searchMeLength = thisHeader.length();
	        int findMeLength = findMe.length();
	        boolean foundIt = false;
	        for (int i = 0; 
	             i <= (searchMeLength - findMeLength);
	             i++) {
	           if (thisHeader.regionMatches(i, findMe, 0, findMeLength)) {
	              foundIt = true;
	              break;
	           }
	        }
	        if (!foundIt){
	            System.err.println("No loggedInUser.");
	            //newStr = null;            
	        }else{
	        	newStr = thisHeader.replace(delStr, "");
	        }
		}else{
			newStr = null;  
		}
		//String base64 = request.getHeader(LOGGED_IN_USER);
        
        String base64 = newStr;
        logger.debug(" here at remember me: " + base64);
        
		//logger.debug("loggedInUser: " + base64);
		if (base64 != null) {
			base64 = ensurePadding(base64);
			if (logger.isTraceEnabled()) {
				logger.trace("Acquired Base64 encoded identity [" + base64 + "]");
			}
			byte[] decoded = Base64.decode(base64);
			if (logger.isTraceEnabled()) {
				logger.trace("Base64 decoded byte array length: "
						+ (decoded != null ? decoded.length : 0) + " bytes.");
			}
			//logger.debug("decoded user: " + decoded);
			response.setHeader(LOGGED_IN_USER, base64);
			return decoded;
		} else {
			// no cookie set - new site visitor?
			//logger.debug("No loggedInUser cookie");
			return null;
		}
		} else {
			return null;
		}

	}

	private String ensurePadding(String base64) {
		int length = base64.length();
		if (length % 4 != 0) {
			StringBuffer sb = new StringBuffer(base64);
			for (int i = 0; i < length % 4; ++i) {
				sb.append('=');
			}
			base64 = sb.toString();
		}
		return base64;
	}

	private boolean isIdentityRemoved(WebSubjectContext subjectContext) {
		ServletRequest request = subjectContext.resolveServletRequest();
/*
		System.out
				.println("identity_removed: "
						+ request
								.getAttribute(ShiroHttpServletRequest.IDENTITY_REMOVED_KEY));
								*/
		HttpServletRequest req = (HttpServletRequest) request;
		
		//logger.debug("identity removed: " + req.getHeader(LOGGED_IN_USER));
		if (request != null) {
			Boolean removed = (Boolean) request
					.getAttribute(ShiroHttpServletRequest.IDENTITY_REMOVED_KEY);
			return removed != null && removed;
		}
		return false;
	}
}