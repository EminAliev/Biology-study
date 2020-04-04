package ru.itis.biology.dto;

import lombok.Data;

@Data
public class CommentDto {
    private String text;
    private Long newsId;
}
