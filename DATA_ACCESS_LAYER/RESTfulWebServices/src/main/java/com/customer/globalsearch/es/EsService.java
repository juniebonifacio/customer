package com.customer.globalsearch.es;

import org.elasticsearch.client.Client;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;

public class EsService {

	protected Node node;
	protected Client client;
	
	public void start() {
		node = NodeBuilder.nodeBuilder().node();
		client = node.client();
	}
	
	public void stop() {
		try {
			//DO NOTHING
		} catch (Exception e) {
			//No Exception to handle
		} finally {
			if (null != node) {
				node.close();				
			}
		}
	}
	
}
