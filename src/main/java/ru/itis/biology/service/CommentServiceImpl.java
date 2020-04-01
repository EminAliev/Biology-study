package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.biology.models.Comment;
import ru.itis.biology.models.Theme;
import ru.itis.biology.models.User;
import ru.itis.biology.repositories.CommentRepository;
import ru.itis.biology.repositories.ThemeRepository;

import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private ThemeRepository themeRepository;

    @Autowired
    private UsersService usersService;


    @Override
    public void send(Long themeId, String text) {
        Theme theme = themeRepository.findById(themeId).orElseThrow(() -> new IllegalArgumentException("Theme not found"));
        User user = usersService.getCurrentUser();
        Comment comment = Comment.builder()
                .theme(theme)
                .text(text)
                .user(user)
                .createdDate(new Date())
                .build();
        commentRepository.save(comment);
    }

    @Override
    public void remove(Comment comment) {
        commentRepository.delete(comment);
    }

    @Override
    public List<Comment> getComments(long id) {
        return commentRepository.getThemeComments(id);
    }
}
