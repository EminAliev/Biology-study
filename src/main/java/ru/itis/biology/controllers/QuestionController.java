package ru.itis.biology.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.itis.biology.models.User;
import ru.itis.biology.service.QuestionService;
import ru.itis.biology.service.UsersService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/test")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private UsersService usersService;

    @GetMapping
    public String index(Model model, HttpServletRequest request) {
        if (request.getParameter("testId") != null) {
            model.addAttribute("questions", questionService.getTestsByThemeId(Long.parseLong(request.getParameter("testId"))));
        }
        return "tests";
    }

    @PostMapping(value = "submit")
    public String submit(HttpServletRequest request) {
        int score = 0;
        String[] questionIds = request.getParameterValues("questionId");
        for (String questionId : questionIds) {
            long answerIdCorrect = questionService.findCorrectAnswerId(Long.parseLong(questionId));
            if (answerIdCorrect == Long.parseLong(request.getParameter("question_" + questionId))) {
                score++;
            }
        }
        request.setAttribute("score", score);
        return "result";
    }
    


}
