package ru.itis.biology.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.biology.models.Question;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findAllByThemeId(Long themeId);
}
