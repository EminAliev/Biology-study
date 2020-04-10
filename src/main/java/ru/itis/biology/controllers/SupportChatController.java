package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.models.User;
import ru.itis.biology.service.MessageService;
import ru.itis.biology.service.UsersService;

import java.util.List;

@Controller
public class SupportChatController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UsersService usersService;

    @GetMapping("/support")
    public String getSupportChatPage(Model model) {
        User user = usersService.getCurrentUser();
        List<UserDto> users = usersService.getUsers();
        model.addAttribute("users", users);
        model.addAttribute("user", user);
        model.addAttribute("admin", usersService.getAdmin().getEmail());
        System.out.println("ADMIN:" + usersService.getAdmin().getEmail());
        model.addAttribute("messages", messageService.getChat(user.getEmail(), usersService.getAdmin().getEmail()));
        return "chat";
    }

    @GetMapping("/admin")
    public String getAdminPage(@RequestParam(value = "whom") String whom, Model model) {
        User user = usersService.getCurrentUser();
        List<UserDto> users = usersService.getUsers();
        model.addAttribute("users", users);
        model.addAttribute("user", user);
        model.addAttribute("messages", messageService.getChat(user.getEmail(), whom));
        return "chat";
    }

}
