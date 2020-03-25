package ru.itis.biology.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogoutController {
    @GetMapping("/logout")
    public String getLogoutPage(Authentication authentication) {
        authentication.setAuthenticated(false);
        return "sign_in";
    }
}
