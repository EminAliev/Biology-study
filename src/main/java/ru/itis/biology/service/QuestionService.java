package ru.itis.biology.service;

import ru.itis.biology.models.Question;

import java.util.List;

public interface QuestionService {
    Iterable<Question> getAll();

    Long findCorrectAnswerId(Long questionId);

    List<Question> getTestsByThemeId(Long themeId);
}
