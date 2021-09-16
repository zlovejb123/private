spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.username=${dbName}
spring.datasource.password=${dbPassword}
spring.datasource.url=jdbc:mysql://localhost:3306/${database}?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai
mybatis.mapper-locations=classpath:/${mapperUrl}/*.xml
mybatis.type-aliases-package=${entityUrl}
mybatis.configuration.map-underscore-to-camel-case=true
spring.jackson.date-format=yyyy-MM-dd HH:mm:ss
spring.jackson.time-zone=GMT+8
server.tomcat.uri-encoding=UTF-8
spring.http.encoding.charset=UTF-8
spring.http.encoding.enabled=true
spring.http.encoding.force=true
spring.messages.encoding=UTF-8