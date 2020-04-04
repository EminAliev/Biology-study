package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.biology.service.UsersService;

@Controller
public class ErrorController {

    @Autowired
    private UsersService usersService;

    @GetMapping("/error")
    public String getError(Model model) {
        model.addAttribute("user", usersService.getCurrentUser());
        return "error";
    }


}
