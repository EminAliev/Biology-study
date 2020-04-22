package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.biology.service.UsersService;

@Controller
public class AdminController {

    @Autowired
    private UsersService usersService;

    @GetMapping("/adminPage")
    public String getPage(Model model) {
        model.addAttribute("users", usersService.getUsers());
        return "admin";
    }

}
