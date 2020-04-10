package ru.itis.biology.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.itis.biology.models.Comment;
import ru.itis.biology.models.Question;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findAllByNews_Id(Long newsId);

    Long findCommentByUserId(Long userId);
}
