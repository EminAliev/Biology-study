package ru.itis.biology.service;

import ru.itis.biology.models.Question;

public interface QuestionService {
    Iterable<Question> getAll();

    Long findCorrectAnswerId(Long questionId);
}
