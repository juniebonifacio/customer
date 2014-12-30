/**
 * 
 */
package com.customer.controller.security;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.customer.utility.RestResponse;

/**
 * @author junie.bonifacio
 *
 */
@Controller
@Path("/login")
@Produces(MediaType.APPLICATION_JSON)
public class LoginController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@POST
	@Path("/credentials")
	@Consumes(MediaType.APPLICATION_JSON)
	public RestResponse login(Credentials credentials) {
		String message = "Calling POST /login/credentials.";
		logger.debug(message);
		RestResponse response = new RestResponse();

		String username = credentials.getUsername();
		String password = credentials.getPassword();
		logger.debug("username: " + username);
		logger.debug("password: " + password);
		
		//TODO: Document LoginController logic.
		
		message = "Called POST /login/credentials.";
		logger.debug(message);
		response.setMessage(message);
		return response;
		
	}
	
}
