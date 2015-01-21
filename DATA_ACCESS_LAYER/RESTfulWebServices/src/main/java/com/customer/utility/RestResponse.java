/**
 * 
 */
package com.customer.utility;

/**
 * @author junie.bonifacio
 *
 */
public class RestResponse {

	private String status;
	private String message;
	private Object dataParam;
	
	public RestResponse() {
		super();
	}
	
	public RestResponse(String status, String message) {
		super();
		this.status = status;
		this.message = message;
	}
	
	public RestResponse(String status, String message, Object dataParam) {
		super();
		this.status = status;
		this.message = message;
		this.dataParam = dataParam;
	}	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getDataParam() {
		return dataParam;
	}
	public void setDataParam(Object dataParam) {
		this.dataParam = dataParam;
	}
	
}
