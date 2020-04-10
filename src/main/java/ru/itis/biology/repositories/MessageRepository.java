package ru.itis.biology.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.biology.models.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> getAllByWhomEmail(String email);

    List<Message> getAllByFromEmail(String email);

    List<Message> getAllByWhomEmailAndFromEmail(String emailWhom, String emailFrom);

    List<Message> getAllByFromEmailAndWhomEmail(String from, String whom);
}
