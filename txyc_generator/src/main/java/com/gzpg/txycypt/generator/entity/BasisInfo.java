package com.gzpg.txycypt.generator.entity;

import java.util.List;

public class BasisInfo {
	//private static final long serialVersionUID = 123123L;
	private static String filePath;
	private String packageName;
	private String className;
	private String project;
	private String author;
	private String version;
	private String dbUrl;
	private String dbName;
	private String dbPassword;
	private String database;
	private String table;
	private String entityName;
	private String objectName;
	private String entityComment;
	private String createTime;
	private String agile;
	private String entityUrl;
	private String configUrl;
	private String daoUrl;
	private String mapperUrl;
	private String serviceUrl;
	private String serviceImplUrl;
	private String controllerUrl;
	private Boolean autoIncrement;
	private Boolean UUID;
	private List<PropertyInfo> ids;
	private List<PropertyInfo> noIds;
	private List<PropertyInfo> cis;
	
	public BasisInfo(String project, String author, String version, String dbUrl, String dbName, String dbPassword,
			String database, String createTime, String agile, String entityUrl, String daoUrl, String mapperUrl,
			String serviceUrl, String serviceImplUrl, String controllerUrl,String configUrl) {
		super();
		this.project = project;
		this.author = author;
		this.version = version;
		this.dbUrl = dbUrl;
		this.dbName = dbName;
		this.dbPassword = dbPassword;
		this.database = database;
		this.createTime = createTime;
		this.agile = agile;
		this.entityUrl = entityUrl;
		this.daoUrl = daoUrl;
		this.mapperUrl = mapperUrl;
		this.serviceUrl = serviceUrl;
		this.serviceImplUrl = serviceImplUrl;
		this.controllerUrl = controllerUrl;
		this.configUrl = configUrl;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getDbUrl() {
		return dbUrl;
	}

	public void setDbUrl(String dbUrl) {
		this.dbUrl = dbUrl;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String getDbPassword() {
		return dbPassword;
	}

	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getEntityComment() {
		return entityComment;
	}

	public void setEntityComment(String entityComment) {
		this.entityComment = entityComment;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getAgile() {
		return agile;
	}

	public void setAgile(String agile) {
		this.agile = agile;
	}

	public String getEntityUrl() {
		return entityUrl;
	}

	public void setEntityUrl(String entityUrl) {
		this.entityUrl = entityUrl;
	}

	public String getDaoUrl() {
		return daoUrl;
	}

	public void setDaoUrl(String daoUrl) {
		this.daoUrl = daoUrl;
	}

	public String getMapperUrl() {
		return mapperUrl;
	}

	public void setMapperUrl(String mapperUrl) {
		this.mapperUrl = mapperUrl;
	}

	public String getServiceUrl() {
		return serviceUrl;
	}

	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
	}

	public String getServiceImplUrl() {
		return serviceImplUrl;
	}

	public void setServiceImplUrl(String serviceImplUrl) {
		this.serviceImplUrl = serviceImplUrl;
	}

	public String getControllerUrl() {
		return controllerUrl;
	}

	public void setControllerUrl(String controllerUrl) {
		this.controllerUrl = controllerUrl;
	}

	public List<PropertyInfo> getCis() {
		return cis;
	}

	public void setCis(List<PropertyInfo> cis) {
		this.cis = cis;
	}

	public List<PropertyInfo> getIds() {
		return ids;
	}

	public void setIds(List<PropertyInfo> ids) {
		this.ids = ids;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Boolean getAutoIncrement() {
		return autoIncrement;
	}

	public void setAutoIncrement(Boolean autoIncrement) {
		this.autoIncrement = autoIncrement;
	}

	public Boolean getUUID() {
		return UUID;
	}

	public void setUUID(Boolean UUID) {
		this.UUID = UUID;
	}

	public List<PropertyInfo> getNoIds() {
		return noIds;
	}

	public void setNoIds(List<PropertyInfo> noIds) {
		this.noIds = noIds;
	}

	public static String getFilePath() {
		return filePath;
	}

	public static void setFilePath(String filePath) {
		BasisInfo.filePath = filePath;
	}

	public String getConfigUrl() {
		return configUrl;
	}

	public void setConfigUrl(String configUrl) {
		this.configUrl = configUrl;
	}
}
