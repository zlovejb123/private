package com.gzpg.txycypt.system.config;

import com.gzpg.txycypt.common.plugin.TxycInterceptor;
import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ${className}MybatisConfig {
    @Bean
    ConfigurationCustomizer ${className?uncap_first}MybatisConfigurationCustomizer() {
        return new ConfigurationCustomizer() {
            @Override
            public void customize(org.apache.ibatis.session.Configuration configuration) {
                configuration.addInterceptor(new TxycInterceptor());
            }
        };
    }
}
