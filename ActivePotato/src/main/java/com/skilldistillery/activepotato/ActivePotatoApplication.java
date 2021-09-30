package com.skilldistillery.activepotato;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ActivePotatoApplication extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ActivePotatoApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(ActivePotatoApplication.class, args);
	}

}
