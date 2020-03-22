package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.biology.dto.ThemeDto;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.models.Question;
import ru.itis.biology.models.Theme;
import ru.itis.biology.models.User;
import ru.itis.biology.repositories.ThemeRepository;

import java.util.List;

@Service
public class ThemeServiceImpl implements ThemeService {

    @Autowired
    private ThemeRepository themeRepository;

    @Override
    public List<ThemeDto> listThemes() {
        List<Theme> themes = themeRepository.findAll();
        return ThemeDto.from(themes);
    }
}
