package com.gzpg.txycypt.generator.util;

import com.gzpg.txycypt.generator.entity.BasisInfo;
import com.gzpg.txycypt.generator.entity.JsonResult;
import com.gzpg.txycypt.generator.entity.PropertyInfo;

import java.util.List;

public class Generator {
	//路径信息
	public static final String ENTITY="entity";
	public static final String CONFIG="config";
	public static final String DAO="dao";
	public static final String DAO_IMPL="mapper";
	public static final String SERVICE="service";
	public static final String SERVICE_IMPL="serviceImpl";
	public static final String CONTROLLER="controller";
	public static final String APPLICATION="application";
	public static final String POM="pom";
	public static final String PROPERTIES="properties";

	
	//①创建实体类
	public static JsonResult createEntity(String url, BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getEntityUrl(), bi.getEntityName(), ENTITY);
		return FreemarkerUtil.createFile(bi, "entity.ftl", fileUrl);
	}
	
	//②创建DAO
	public static JsonResult createDao(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getDaoUrl(), bi.getEntityName(), DAO);
		return FreemarkerUtil.createFile(bi, "dao.ftl", fileUrl);
	}
	
	//③创建mapper配置文件
	public static JsonResult createDaoImpl(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getMapperUrl(), bi.getEntityName(), DAO_IMPL);
		List<PropertyInfo> list=bi.getCis();
		String agile="";
		for (PropertyInfo propertyInfo : list) {
			agile=agile + propertyInfo.getColumn()+", ";
		}
		agile=agile.substring(0, agile.length()-2);
		bi.setAgile(agile);
		return FreemarkerUtil.createFile(bi, "mapper.ftl", fileUrl);
	}
	
	//④创建SERVICE
	public static JsonResult createService(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getServiceUrl(), bi.getEntityName(), SERVICE);
		return FreemarkerUtil.createFile(bi, "service.ftl", fileUrl);
	}
	
	//⑤创建SERVICE_IMPL
	public static JsonResult createServiceImpl(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getServiceImplUrl(), bi.getEntityName(), SERVICE_IMPL);
		return FreemarkerUtil.createFile(bi, "serviceImpl.ftl", fileUrl);
	}
	
	//⑥创建CONTROLLER
	public static JsonResult createController(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getControllerUrl(), bi.getEntityName(), CONTROLLER);
		return FreemarkerUtil.createFile(bi, "controller.ftl", fileUrl);
	}

	//⑥创建pom.xml
	public static JsonResult createPom(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), "", bi.getEntityName(), POM);
		return FreemarkerUtil.createFile(bi, "pom.ftl", fileUrl);
	}

	//⑥创建Application
	public static JsonResult createApplication(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getPackageName(), bi.getClassName(), APPLICATION);
		return FreemarkerUtil.createFile(bi, "application.ftl", fileUrl);
	}

	//⑥创建application.properties
	public static JsonResult createProperties(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getControllerUrl(), bi.getEntityName(), PROPERTIES);
		return FreemarkerUtil.createFile(bi, "properties.ftl", fileUrl);
	}

	//⑥创建Config
	public static JsonResult createConfig(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url + bi.getProject(), bi.getConfigUrl(), bi.getClassName(), CONFIG);
		return FreemarkerUtil.createFile(bi, "mybatisconfig.ftl", fileUrl);
	}
	//生成文件名
	public static String getGeneratorFileUrl(String url,String packageUrl,String entityName, String type){
		String src = url + "\\src\\main\\java\\";
		String res = url + "\\src\\main\\resources\\";
		if (type.equals("entity")) {
			return src+pageToUrl(packageUrl)+entityName+".java";
		}else if(type.equals("dao")) {
			return src+pageToUrl(packageUrl)+entityName+"Dao.java";
		}else if(type.equals("mapper")) {
			return res+pageToUrl(packageUrl)+entityName+"Mapper.xml";
		}else if(type.equals("service")) {
			return src+pageToUrl(packageUrl)+entityName+"Service.java";
		}else if(type.equals("serviceImpl")) {
			return src+pageToUrl(packageUrl)+entityName+"ServiceImpl.java";
		}else if(type.equals("controller")) {
			return src+pageToUrl(packageUrl)+entityName+"Controller.java";
		}else if(type.equals("config")) {
			return src+pageToUrl(packageUrl)+entityName+"MybatisConfig.java";
		}else if(type.equals("application")) {
			return src+"\\"+pageToUrl(packageUrl)+entityName+"Application.java";
		}else if(type.equals("pom")) {
			return url+"\\pom.xml";
		}else if(type.equals("properties")) {
			return res + "application.properties";
		}
		return null;
	}
	
	public static String pageToUrl(String url) {
		return url.replace(".", "/")+"/";
	}
}
