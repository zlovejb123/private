package com.gzpg.txycypt.generator;

import com.gzpg.txycypt.generator.util.EntityInfoUtil;
import com.gzpg.txycypt.generator.util.Generator;
import com.gzpg.txycypt.generator.util.MySqlToJavaUtil;
import com.sun.xml.internal.fastinfoset.util.StringArray;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.env.Environment;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gzpg.txycypt.generator.entity.BasisInfo;

class ClassProperty {
    String table;
    String comment;
    String date;
}

class ProjectProperty{
    String name;
    String author;
    String version;
    List<ClassProperty> tables;
}

@RunWith(SpringRunner.class)
@SpringBootTest
public class TxycGeneratorApplicationTests {
    @Autowired
    private Environment env;
    //private String project;
//    private String author;
//    private String version;
    @Value("${spring.datasource.url}")
    private String url;
    @Value("${spring.datasource.username}")
    private String name;
    @Value("${spring.datasource.password}")
    private String pass;
    private String database = "txyc";
//    private String time;
    private String agile;
    private String package_url;
    private String entity_url;
    private String dao_url;
    private String xml_url;
    private String config_url;
    private String service_url;
    private String service_impl_url;
    private String controller_url;
//    private String table;
//    private String classcomment;
    private String classname;
    private List<BasisInfo> basisInfos;

    private void getClassInfo(String prefixClass)
    {
    }

    private void init()
    {
        String prefix = "txyc";
        String propertyPrefix = "txyc.project";
        String property;
        ProjectProperty projects =  new ProjectProperty();
        int loop = 0;
        agile = new Date().getTime() + "";
        xml_url = Generator.DAO_IMPL;
        basisInfos = new ArrayList<>();
        do {
            String propertyName;
            if (loop == 0)
                propertyName = propertyPrefix;
            else
                propertyName = String.format("%s%d",propertyPrefix, loop);
            property = env.getProperty(propertyName);
            if (property != null) {
                String prefixClass = propertyName;
                ProjectProperty projectProperty = new ProjectProperty();
                property = property.replaceAll("[^a-zA-Z]", "").toLowerCase();
                projectProperty.name = property;
                propertyName = String.format("%s%d.author",propertyPrefix,loop);
                projectProperty.author = env.getProperty(propertyName,"贵州品高科技");
                propertyName = String.format("%s%d.version",propertyPrefix,loop);
                projectProperty.version = env.getProperty(propertyName,"版本 1.0.0");

                String propertyPrefixClass = String.format("%s.table",prefixClass);
                int loopClass = 0;
                String propertyClass;
                do {
                    String propertyNameClass;
                    if (loopClass == 0)
                        propertyNameClass = propertyPrefixClass;
                    else
                        propertyNameClass = String.format("%s%d",propertyPrefixClass, loopClass);
                    propertyClass = env.getProperty(propertyNameClass);
                    if (propertyClass != null) {
                        ClassProperty classProperty = new ClassProperty();
                        classProperty.table = propertyClass;
                        propertyNameClass = String.format("%s%d.classcomment",propertyPrefixClass,loopClass);
                        classProperty.comment = env.getProperty(propertyNameClass,"类");
                        propertyNameClass = String.format("%s%d.time",propertyPrefixClass,loopClass);
                        classProperty.date  = env.getProperty(propertyNameClass,"2019年07月31日");

                        String projectName;
                        projectName = projectProperty.name;
                        package_url = "com.gzpg.txycypt." + projectName;
                        entity_url = package_url + "." + Generator.ENTITY;
                        dao_url = package_url + "." + Generator.DAO;
                        config_url = package_url + "." + Generator.CONFIG;
                        service_url = package_url + "." + Generator.SERVICE;
                        service_impl_url = service_url + ".impl";
                        controller_url = package_url + "." + Generator.CONTROLLER;
                        classname = prefix.substring(0, 1).toUpperCase() + prefix.substring(1) + projectName.substring(0, 1).toUpperCase() + projectName.substring(1);
                        database = prefix;
                        projectName = prefix + "_" + projectName;
                        BasisInfo bi = new BasisInfo(
                                projectName, projectProperty.author, projectProperty.version, url, name, pass, database, classProperty.date, agile,
                                entity_url, dao_url, xml_url, service_url, service_impl_url, controller_url,config_url);
                        bi.setTable(classProperty.table);
                        String strTable = classProperty.table.substring(2);
                        bi.setEntityName(MySqlToJavaUtil.getClassName(strTable));
                        bi.setObjectName(MySqlToJavaUtil.changeToJavaFiled(strTable));
                        bi.setEntityComment(classProperty.comment);
                        bi.setPackageName(package_url);
                        bi.setClassName(classname);
                        basisInfos.add(bi);

                        loopClass++;
                    }
                } while (propertyClass != null);
                getClassInfo(propertyPrefix);
                loop++;
            }
        } while (property != null);
    }
    @Test
    public void contextLoads() {
        init();
        String fileUrl = System.getProperty("user.dir");// 生成文件存放位置
        fileUrl = fileUrl.substring(0, fileUrl.length() - 14);
        for (BasisInfo bi: basisInfos) {
            try {
                //String tableName = bi.getTable();
                BasisInfo basisInfo = EntityInfoUtil.getInfo(bi);
                if (basisInfo != null) {
                    System.out.println(Generator.createEntity(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createDao(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createDaoImpl(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createService(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createServiceImpl(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createController(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createPom(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createApplication(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createProperties(fileUrl, basisInfo).getMessage());
                    System.out.println(Generator.createConfig(fileUrl, basisInfo).getMessage());
                }else {
                    System.out.println(bi.getTable() + " 不存在! ");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
