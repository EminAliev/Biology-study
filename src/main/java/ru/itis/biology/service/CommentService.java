package ru.itis.biology.service;

import ru.itis.biology.dto.CommentDto;
import ru.itis.biology.models.Comment;

import java.util.List;

public interface CommentService {

    void send(Long newsId, CommentDto commentDto);

    void remove(Comment comment);

    List<Comment> getComments(long id);


}
