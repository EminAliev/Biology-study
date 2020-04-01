package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.itis.biology.service.CommentService;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping("/comment/{id}")
    public String sendComment(@PathVariable("id") Long themeId, @RequestParam("text") String text,
                              RedirectAttributes redirectAttributes) {
        commentService.send(themeId, text);

        return "";
    }
}

