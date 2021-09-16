<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <artifactId>txyc-parent</artifactId>
        <groupId>com.gzpg.txycypt</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>

    <artifactId>txyc-${project?substring(5)}</artifactId>
    <description>${entityComment}</description>

    <dependencies>
        <dependency>
            <groupId>com.gzpg.txycypt</groupId>
            <artifactId>txyc-common</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>

</project>
