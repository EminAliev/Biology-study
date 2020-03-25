package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.service.ProfileService;

@Controller
public class HomePageController {

    @Autowired
    private ProfileService profileService;

    @GetMapping("/")
    public String getHomePage(Authentication authentication, Model model) {
        if (authentication != null) {
            UserDto user = profileService.getUserInformation(authentication);
            model.addAttribute("user", user);
        }
        return "index";
    }
}
