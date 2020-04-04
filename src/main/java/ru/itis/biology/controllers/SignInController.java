package ru.itis.biology.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class SignInController {

    @GetMapping("/signIn")
    public String getSignIn(Authentication authentication, @RequestParam Optional<String> error, Model model) {
        if (authentication != null) {
            return "redirect:/";
        }
        model.addAttribute("error", error);
        return "sign_in";
    }
}
