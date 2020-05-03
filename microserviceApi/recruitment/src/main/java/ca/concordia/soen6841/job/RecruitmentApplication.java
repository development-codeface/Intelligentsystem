package ca.concordia.soen6841.job;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;

import ca.concordia.soen6841.service.StorageProperties;
import ca.concordia.soen6841.service.StorageService;

@SpringBootApplication
@ComponentScan("ca.concordia.soen6841")
@EnableConfigurationProperties(StorageProperties.class)
@EnableEurekaClient
public class RecruitmentApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(RecruitmentApplication.class, args);
		
	}
	
	@Bean
	CommandLineRunner init(StorageService storageService) {
		return (args) -> {
			storageService.deleteAll();
			storageService.init();
		};
	}
}
