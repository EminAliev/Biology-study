package ru.itis.biology.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.biology.models.Question;

public interface QuestionRepository extends JpaRepository<Question, Long> {

}
