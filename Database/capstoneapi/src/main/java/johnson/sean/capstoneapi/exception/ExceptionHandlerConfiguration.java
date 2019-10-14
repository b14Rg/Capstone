package johnson.sean.capstoneapi.exception;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class ExceptionHandlerConfiguration {
    @Autowired
    private Logger logger;

    @ExceptionHandler(value = AuthenticationException.class)
    private ResponseEntity<Object> handleAuthenticationException(AuthenticationException ex, WebRequest request) {
        return new ResponseEntity<>("", HttpStatus.UNAUTHORIZED);
    }

    @ExceptionHandler(value = NoSuchEntityException.class)
    private ResponseEntity<Object> handleNoSuchEntityException(NoSuchEntityException ex, WebRequest request) {
        Map<String, Object> body = new HashMap<>();
        body.put("id", ex.getId());
        body.put("type", ex.getType());
        logger.error("Error on request" + request, ex);
        return new ResponseEntity<>(body, HttpStatus.NOT_FOUND);
    }
}
