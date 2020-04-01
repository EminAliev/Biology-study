package ru.itis.biology.service;

import ru.itis.biology.models.Comment;

import java.util.List;

public interface CommentService {

    void send(Long themeId, String text);

    void remove(Comment comment);

    List<Comment> getComments(long id);


}
