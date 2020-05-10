package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.biology.dto.SignUpDto;
import ru.itis.biology.service.SignUpService;

import javax.validation.Valid;


@Controller
public class SignUpController {

    @Autowired
    private SignUpService service;


    @GetMapping("/signUp")
    public String getSignUpPage(Authentication authentication, Model model) {
        if (authentication != null) {
            return "redirect:/profile";
        }
        model.addAttribute("form", new SignUpDto());
        return "sign_up";
    }

    @PostMapping("/signUp")
    public String signUp(@Valid SignUpDto form, BindingResult bindingResult, Model model) {
        System.out.println(form);
        service.signUp(form);
        System.out.println(bindingResult.getAllErrors());
        model.addAttribute("form", form);
        return "redirect:/";
    }
}
