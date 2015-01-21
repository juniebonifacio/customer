package com.customer.globalsearch.es.model;

public class SearchableAsset implements Searchable {

	private String title;
	private String description;
	private String keywords;
	private String storeType;
	private String id;
	private String subType;
	
	private String relationalKey;
	private String documentKey;
	private String nodeClass;
	private String clientMasterId;
	private String imageUrl;
	private String[] phrases;
	private String index_name;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getStoreType() {
		return storeType;
	}
	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubType() {
		return subType;
	}
	public void setSubType(String subType) {
		this.subType = subType;
	}
	public String getRelationalKey() {
		return relationalKey;
	}
	public void setRelationalKey(String relationalKey) {
		this.relationalKey = relationalKey;
	}
	public String getDocumentKey() {
		return documentKey;
	}
	public void setDocumentKey(String documentKey) {
		this.documentKey = documentKey;
	}
	public String getNodeClass() {
		return nodeClass;
	}
	public void setNodeClass(String nodeClass) {
		this.nodeClass = nodeClass;
	}
	public String getClientMasterId() {
		return clientMasterId;
	}
	public void setClientMasterId(String clientMasterId) {
		this.clientMasterId = clientMasterId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String[] getPhrases() {
		return phrases;
	}
	public void setPhrases(String[] phrases) {
		this.phrases = phrases;
	}
	public String getIndex_name() {
		return index_name;
	}
	public void setIndex_name(String index_name) {
		this.index_name = index_name;
	}
	
}
