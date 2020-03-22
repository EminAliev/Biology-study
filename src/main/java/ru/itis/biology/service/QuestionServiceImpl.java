package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.biology.models.Answer;
import ru.itis.biology.models.Question;
import ru.itis.biology.repositories.QuestionRepository;

import java.util.List;
import java.util.Optional;

@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    @Override
    public Iterable<Question> getAll() {
        return questionRepository.findAll();
    }

    @Override
    public Long findCorrectAnswerId(Long questionId) {
        Optional<Question> questionCandidate = questionRepository.findById(questionId);
        Question question = questionCandidate.get();
        for (Answer answer : question.getAnswers()) {
            return answer.getId();
        }
        return Long.valueOf(-1);
    }

    @Override
    public List<Question> getTestsByThemeId(Long themeId) {
        return questionRepository.findAllByThemeId(themeId);
    }
}
