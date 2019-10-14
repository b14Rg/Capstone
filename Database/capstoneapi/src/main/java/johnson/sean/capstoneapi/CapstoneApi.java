package johnson.sean.capstoneapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@SpringBootConfiguration
@ComponentScan
public class CapstoneApi extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(CapstoneApi.class, args);
    }
}
