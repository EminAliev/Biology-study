package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.security.UserDetailsImpl;
import ru.itis.biology.service.ProfileService;

@Controller
public class EditProfileController {

    @Autowired
    private ProfileService profileService;

    @GetMapping("/editProfile")
    public String getEditProfilePage(Model model,
                                     Authentication authentication) {
        UserDto user = profileService.getUserInformation(authentication);
        model.addAttribute("user", user);
        return "edit_profile";
    }

    @PostMapping("/editProfile")
    public String editProfile(UserDto userDto, Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        profileService.editProfile(userDto, userDetails.getUser());
        return "redirect:/profile";
    }
}