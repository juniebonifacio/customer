package com.customer.initlisteners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

public class TaskRuntimeContextInitializer implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent ctx) {
		//EventsQueuer2.getInstance().setStop(true);
	}

	public void contextInitialized(ServletContextEvent ctx) {
		ApplicationContext appCtx = (ApplicationContext) ctx.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		if(null != appCtx){
			//Resource r = appCtx.getBean(Resource.class);
			//if(null != r){
			//	EventsQueuer2.getInstance(r);
			//}
		}
	}

}

