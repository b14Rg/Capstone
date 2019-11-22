package johnson.sean.capstoneapi.configuration;

import johnson.sean.capstoneapi.CapstoneApi;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CapstoneApiConfiguration {
    @Bean
    public Logger logger() {
        return LoggerFactory.getLogger(CapstoneApi.class);
    }

    public void adjustLogginglevel(ch.qos.logback.classic.Level newLevel) {
        ch.qos.logback.classic.Logger l = (ch.qos.logback.classic.Logger) logger();
        l.setLevel(newLevel);
    }
}
