package com.gzpg.txycypt.generator.entity;

public class PropertyInfo{
	
	//private static final long serialVersionUID = 123124L;
	//字段名
	private String column;
	//字段类型
	private String jdbcType;
	//字段注释
	private String comment;
	//对应的属性名
	private String property;
	//属性类型
	private String javaType;
	//是否可以为空
	private Boolean nullable;
	//是否自增
	private Boolean autoIncrement;
	//是否主键
	private Boolean primekey;
	//是否唯一索引
	private Boolean uniqe;
	//是否有索引
	private Boolean index;
	//外键表
	private String referencedTable;
	//外键字段
	private String referencedColumn;

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getJdbcType() {
		return jdbcType;
	}

	public void setJdbcType(String jdbcType) {
		this.jdbcType = jdbcType;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	public Boolean getAutoIncrement() {
		return autoIncrement;
	}

	public void setAutoIncrement(Boolean autoIncrement) {
		this.autoIncrement = autoIncrement;
	}

	public Boolean getPrimekey() {
		return primekey;
	}

	public void setPrimekey(Boolean primekey) {
		this.primekey = primekey;
	}

	public Boolean getUniqe() {
		return uniqe;
	}

	public void setUniqe(Boolean uniqe) {
		this.uniqe = uniqe;
	}

	public Boolean getIndex() {
		return index;
	}

	public void setIndex(Boolean index) {
		this.index = index;
	}

	public String getReferencedTable() {
		return referencedTable;
	}

	public void setReferencedTable(String referencedTable) {
		this.referencedTable = referencedTable;
	}

	public String getReferencedColumn() {
		return referencedColumn;
	}

	public void setReferencedColumn(String referencedColumn) {
		this.referencedColumn = referencedColumn;
	}

	public Boolean getNullable() {
		return nullable;
	}

	public void setNullable(Boolean nullable) {
		this.nullable = nullable;
	}
}
