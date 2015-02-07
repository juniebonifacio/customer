package com.customer.globalsearch.es;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.update.UpdateResponse;

import com.customer.globalsearch.es.model.SearchableAsset;

public class Indexer extends EsService {

	private static final String INDEX_NAME = "prompteur";
	private static final Logger logger = Logger.getLogger(Indexer.class);
	
	public IndexResponse index(SearchableAsset searchableAsset) {
		ObjectMapper mapper = new ObjectMapper();
		IndexResponse response = null;
		
		try {
			String json = mapper.writeValueAsString(searchableAsset);
			logger.debug("Index name is prompteur");
			response = client.prepareIndex(INDEX_NAME, searchableAsset.getNodeClass()).setSource(json).execute().actionGet();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return response;
	}
	
	public UpdateResponse upsert(SearchableAsset searchableAsset) {
		ObjectMapper mapper = new ObjectMapper();
		
		UpdateResponse response = null;
		try {
			String json = mapper.writeValueAsString(searchableAsset);
			logger.debug("indexing json: " + json + "to 'prompteur'");
			response = client.prepareUpdate(INDEX_NAME, searchableAsset.getNodeClass(), searchableAsset.getId()).setDoc(json).setDocAsUpsert(true).execute().actionGet();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
	
	public DeleteResponse delete(SearchableAsset searchableAsset) {
		logger.debug("deleting document from index 'prompteur'");
		DeleteResponse response = client.prepareDelete(INDEX_NAME, searchableAsset.getNodeClass(), searchableAsset.getId()).execute().actionGet();
		return response;
	}
	
}
