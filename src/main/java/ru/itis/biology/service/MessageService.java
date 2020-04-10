package ru.itis.biology.service;

import ru.itis.biology.dto.MessageDto;
import ru.itis.biology.models.Message;

import java.util.List;

public interface MessageService {
    List<Message> getAllMessages();

    List<MessageDto> getChat(String emailFrom, String emailWhom);

    void add(MessageDto form);
}
