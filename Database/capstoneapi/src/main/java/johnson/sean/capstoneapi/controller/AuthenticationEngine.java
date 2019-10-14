package johnson.sean.capstoneapi.controller;

import johnson.sean.capstoneapi.exception.AuthenticationException;

import java.util.Base64;

public class AuthenticationEngine {
    public void auth(String authHeaderValues) {
        if(authHeaderValues == null) {
            throw new AuthenticationException();
        }
        String rawCredentials = new String(Base64.getDecoder().decode(authHeaderValues));
        String[] credentials_parts = rawCredentials.split(":");
        String username = credentials_parts[0].trim();
        String password = credentials_parts[1];
        if(!username.equals("user") || !password.equals("test")) {
            throw new AuthenticationException();
        }
    }
}
