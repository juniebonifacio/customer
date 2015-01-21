package com.customer.security;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import com.sun.jersey.spi.container.ContainerRequest;
import com.sun.jersey.spi.container.ContainerResponse;
import com.sun.jersey.spi.container.ContainerResponseFilter;

public class ResponseCorsFilter implements ContainerResponseFilter{
	
	
	public ContainerResponse filter(ContainerRequest contRequest, ContainerResponse contResponse) {
		ResponseBuilder responseBuilder = Response.fromResponse(contResponse.getResponse());
		responseBuilder.header("Access-Control-Allow-Origin", "*")
				.header("Access-Control-Allow-Methods",
				"GET, POST, PUT, DELETE, OPTIONS")
				.header("Access-Control-Allow-Headers", "X-Requested-With, content-type, accept")
				.header("Access-Control-Allow-Credentials", true);
		
		contResponse.setResponse(responseBuilder.build());
		return contResponse;
	}
}
