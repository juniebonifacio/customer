/**
 * 
 */
package com.customer.globalsearch.es;

import org.apache.log4j.Logger;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.FilterBuilders;
import org.elasticsearch.index.query.QueryBuilders;

import com.customer.globalsearch.es.model.SearchableAsset;

public class QueryService extends EsService {

	private static final String INDEX_NAME = "prompteur";
	private static final Logger logger = Logger.getLogger(QueryService.class);
	
	public SearchResponse search(SearchableAsset searchableAsset) {
		
		String query = QueryBuilders.multiMatchQuery(searchableAsset.getTitle(), "title", "description", "keywords").toString();
		logger.debug("query: " + query);
		
		String filter = FilterBuilders.termFilter("clientMasterId", searchableAsset.getClientMasterId()).toString();
		return null;
	}
	
}
