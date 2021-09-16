package com.gzpg.txycypt.generator.util;

import com.gzpg.txycypt.generator.entity.BasisInfo;
import com.gzpg.txycypt.generator.entity.PropertyInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EntityInfoUtil {
	public static BasisInfo getInfo(BasisInfo bi) throws SQLException {
		List<PropertyInfo> columns= new ArrayList<PropertyInfo>();
		List<PropertyInfo> ids= new ArrayList<PropertyInfo>();
		List<PropertyInfo> noIds= new ArrayList<PropertyInfo>();
		// 创建连接
		Connection con = null;
		PreparedStatement pstemt = null;
		//sql
		String sql = "select a.column_name,data_type,column_comment,column_key,extra,is_nullable,referenced_table_name,referenced_column_name from information_schema.columns a left join (select column_name,table_schema,table_name,max(referenced_table_name) as referenced_table_name,max(referenced_column_name) as referenced_column_name from information_schema.key_column_usage b where b.table_schema='"+bi.getDatabase()+"' and b.table_name='"+bi.getTable()+"' group by column_name) b on a.table_schema = b.table_schema and a.table_name = b.table_name and a.column_name = b.column_name where a.table_schema='"+bi.getDatabase()+"' and a.table_name='"+bi.getTable()+"' order by a.ordinal_position";
		//System.out.println(sql);
		try {
			con = DriverManager.getConnection(bi.getDbUrl(), bi.getDbName(), bi.getDbPassword());
			pstemt = con.prepareStatement(sql);
			ResultSet executeQuery = pstemt.executeQuery();
			if (!executeQuery.isBeforeFirst())
				return null;
			while (executeQuery.next()) {
				String column = executeQuery.getString(1);
				String jdbcType = executeQuery.getString(2);
				String comment = executeQuery.getString(3);
				String pri = executeQuery.getString(4);
				String extra = executeQuery.getString(5);
				String nullable = executeQuery.getString(6);
				String referenced_table = executeQuery.getString(7);
				String referenced_column = executeQuery.getString(8);
				//System.out.println(column + " " + pri + " " + extra);
				PropertyInfo ci=new PropertyInfo();
				ci.setColumn(column);
				if (jdbcType.equalsIgnoreCase("int")) {
					ci.setJdbcType("Integer");
				}else if (jdbcType.equalsIgnoreCase("datetime")) {
					ci.setJdbcType("timestamp");
				}else if (jdbcType.equalsIgnoreCase("text")) {
					ci.setJdbcType("varchar");
				}else {
					ci.setJdbcType(jdbcType);
				}
				ci.setComment(comment);
				ci.setProperty(MySqlToJavaUtil.changeToJavaFiled(column));
				ci.setJavaType(MySqlToJavaUtil.jdbcTypeToJavaType(jdbcType));
				//设置注解类型
				if (extra.equals("auto_increment"))
					ci.setAutoIncrement(Boolean.TRUE);
				if (!nullable.equals("NO"))
					ci.setNullable(Boolean.TRUE);
				ci.setReferencedColumn(referenced_column);
				ci.setReferencedTable(referenced_table);
				if (pri.equals("PRI")) {
					ci.setIndex(Boolean.TRUE);
					ci.setUniqe(Boolean.TRUE);
					ci.setPrimekey(Boolean.TRUE);
					ids.add(ci);
					//System.out.println("Pri");
				} else{
					if (pri.equals("UNI")) {
						ci.setIndex(Boolean.TRUE);
						ci.setUniqe(Boolean.TRUE);
					} else if (pri.equals("MUL")) {
						ci.setIndex(Boolean.TRUE);
					}
					noIds.add(ci);
				}
				columns.add(ci);
			}
			bi.setCis(columns);
			bi.setIds(ids);
			bi.setNoIds(noIds);
			bi.setAutoIncrement(Boolean.FALSE);
			bi.setUUID(Boolean.FALSE);
			if (ids.size()==1)
			{
				if (ids.get(0).getAutoIncrement()!=null) {
					bi.setAutoIncrement(Boolean.TRUE);
				} else {
					bi.setUUID(Boolean.TRUE);
				}
			}
			//System.out.println(bi.getIds().size());
			return bi;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("自动生成实体类错误："+e.getMessage());
		} finally {
			pstemt.close();
			con.close();
		}
	}
}
