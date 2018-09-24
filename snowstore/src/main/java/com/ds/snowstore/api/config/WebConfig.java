package com.ds.snowstore.api.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("com.ds.snowstore")
public class WebConfig extends WebMvcConfigurerAdapter {
	
	
	// replaces -> <mvc:resources location="/assets/" mapping="/resources/**" />
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/resources/**").addResourceLocations("/assets/");
	}
	
	@Bean
	public InternalResourceViewResolver getInternalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("../webapp/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
    @Bean
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }
	
//	<multipart-config>
//	<max-file-size>2097152</max-file-size>
//	<max-request-size>4194304</max-request-size>
//	<file-size-threshold>1048576</file-size-threshold>
//  </multipart-config>
	
	// code goes here

}
