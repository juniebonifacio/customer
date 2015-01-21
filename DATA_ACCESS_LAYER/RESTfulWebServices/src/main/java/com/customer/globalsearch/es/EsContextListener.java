package com.customer.globalsearch.es;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.apache.xalan.xsltc.compiler.sym;


public class EsContextListener implements ServletContextListener {

	private static final Logger logger = Logger.getLogger(EsContextListener.class);
	public static QueryService queryService;
	public static Indexer indexer;

	public void contextInitialized(ServletContextEvent sce) {
		startServices();

	}


	public void contextDestroyed(ServletContextEvent sce) {
		//stopServices();

	}

	private void startServices() {
		logger.info("Starting GlobalSearch...");
		synchronized (EsContextListener.class) {
			if (null == EsContextListener.queryService) {
				EsContextListener.queryService = new QueryService();
				EsContextListener.queryService.start();
			}
			
			if (null == EsContextListener.indexer) {
				EsContextListener.indexer = new Indexer();
				EsContextListener.indexer.start();
			
			}
		}
		logger.info("Started GlobalSearch...");
	}

	private void stopServices() {
		logger.debug("Stopping GlobalSearch...");
		synchronized (EsContextListener.class) {
			if(null != EsContextListener.queryService) {
				EsContextListener.queryService.stop();
				EsContextListener.queryService = null;
			}
			if (null != EsContextListener.indexer){
				EsContextListener.indexer.stop();
				EsContextListener.indexer = null;
			}
			
		}
	}
	

//	private void stopServices() {
//		logger.debug("Stopping SocialSentimentQueryService");
//		synchronized(EsContextListener.class){
//			if(null != EsContextListener.queryService){
//				EsContextListener.queryService.stop();
//				EsContextListener.queryService = null;
//			}
//
//			if(null != EsContextListener.indexer){
//				EsContextListener.indexer.stop();
//				EsContextListener.indexer = null;
//			}
//		}
//		
//	}

}
