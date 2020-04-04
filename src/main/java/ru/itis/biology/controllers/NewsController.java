package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.itis.biology.dto.CommentDto;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.models.News;
import ru.itis.biology.models.User;
import ru.itis.biology.service.CommentService;
import ru.itis.biology.service.NewsService;
import ru.itis.biology.service.UsersService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/news")
    public String index(Authentication authentication, Model model) {
        if (authentication != null) {
            User user = usersService.getUserByAuthentication(authentication);
            model.addAttribute("user", user);
        }
        model.addAttribute("news", newsService.findAllNews());
        return "news";
    }

    @GetMapping("/news/{news-id}")
    public String getConcreteNewsPage(@PathVariable("news-id") Long newsId, Model model, Authentication authentication, HttpServletRequest request) {
        if (authentication != null) {
            User user = usersService.getUserByAuthentication(authentication);
            model.addAttribute("user", user);
        }
        HttpSession session = request.getSession();
        session.setAttribute("newsId", newsId);
        List<UserDto> users = usersService.getUsers();
        model.addAttribute("users", users);
        model.addAttribute("news", newsService.findByID(newsId).get());
        model.addAttribute("comments", commentService.getComments(newsId));
        return "news_in";
    }

    @PostMapping("/news")
    public String setCommentNewsPage(Authentication authentication, CommentDto commentDto, HttpServletRequest request) {
        commentDto.setNewsId(Long.parseLong(String.valueOf(request.getSession().getAttribute("newsId"))));
        if (authentication != null) {
            commentService.send(commentDto.getNewsId(), commentDto);
        }
        return "redirect:/news/" + commentDto.getNewsId();
    }

}
