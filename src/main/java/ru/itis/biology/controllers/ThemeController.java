package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.biology.dto.ThemeDto;
import ru.itis.biology.service.TeacherService;
import ru.itis.biology.service.ThemeService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ThemeController {

    @Autowired
    private ThemeService themeService;

    @Autowired
    private TeacherService teacherService;


    @GetMapping("/theme")
    public String getThemePage(Model model, HttpServletRequest request) {
        List<ThemeDto> themes = themeService.listThemes();
        model.addAttribute("themes", themes);
        model.addAttribute("url", request.getContextPath());
        if (request.getParameter("themeId") != null) {
            model.addAttribute("theme", themes.get(Integer.parseInt(request.getParameter("themeId")) - 1));
        }
        return "themes";
    }
    @PreAuthorize("hasRole('TEACHER')")
    @PostMapping("/theme")
    public String proposeTheme(ThemeDto form) {
        teacherService.addTheme(form);
        return "redirect:/theme";
    }



}
