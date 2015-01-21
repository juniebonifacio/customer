package com.customer.initlisteners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

public class InitAppContextListener implements ServletContextListener  {
	
	private static final Logger logger = Logger.getLogger(InitAppContextListener.class);
	
	//@Override
	public void contextInitialized(ServletContextEvent sce) {
		logger.debug("Initializing User List into CRM.....");
		ApplicationContext appCtx = (ApplicationContext) sce.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		initialize(appCtx);
	}

	public void initialize(ApplicationContext appCtx){

	}

	//@Override
	public void contextDestroyed(ServletContextEvent sce) {

		
	}

}
