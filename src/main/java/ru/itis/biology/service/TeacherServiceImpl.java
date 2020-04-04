package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.biology.dto.ThemeDto;
import ru.itis.biology.models.Theme;
import ru.itis.biology.repositories.ThemeRepository;


@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private ThemeRepository themeRepository;

    @Override
    public void addTheme(ThemeDto form) {
        Theme theme = Theme.builder()
                .nameTheme(form.getNameTheme())
                .textTheme(form.getTextTheme())
                .build();

        themeRepository.save(theme);
    }

}

