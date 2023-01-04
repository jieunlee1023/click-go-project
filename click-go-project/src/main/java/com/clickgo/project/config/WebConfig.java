package com.clickgo.project.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Value("${licenceFile.path}")
	private String licenceFolder;

	@Value("${layoutFile.path}")
	private String layoutFolder;
	
	@Value("${storeImageFile.path}")
	private String storeImageFileFolder;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		
		registry.addResourceHandler("/licence/**")
		.addResourceLocations("file:///"+licenceFolder)
		.setCachePeriod(60*10*6)
		.resourceChain(true)
		.addResolver(new PathResourceResolver());
		
		registry.addResourceHandler("/layout/**")
		.addResourceLocations("file:///"+layoutFolder)
		.setCachePeriod(60*10*6)
		.resourceChain(true)
		.addResolver(new PathResourceResolver());
		
		registry.addResourceHandler("/storeImage/**")
		.addResourceLocations("file:///"+storeImageFileFolder)
		.setCachePeriod(60*10*6)
		.resourceChain(true)
		.addResolver(new PathResourceResolver());
	}
	
}
