package ru.itis.biology.dto;

import lombok.Data;
import ru.itis.biology.models.Answer;

import java.util.Set;

@Data
public class QuestionDto {
    private String content;
    private Set<Answer> answers;
}
