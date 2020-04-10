package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.biology.dto.MessageDto;
import ru.itis.biology.models.Message;
import ru.itis.biology.models.User;
import ru.itis.biology.repositories.MessageRepository;
import ru.itis.biology.repositories.UsersRepository;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private MessageRepository messageRepository;

    @Override
    public List<Message> getAllMessages() {
        return messageRepository.findAll();
    }

    @Override
    public List<MessageDto> getChat(String emailFrom, String emailWhom) {
        List<Message> chat = messageRepository.getAllByWhomEmailAndFromEmail(emailFrom, emailWhom);
        chat.addAll(messageRepository.getAllByWhomEmailAndFromEmail(emailWhom, emailFrom));
        chat.sort(Comparator.comparingLong(Message::getId));
        return MessageDto.from(chat);
    }

    @Override
    public void add(MessageDto form) {

        Optional<User> from = usersRepository.findByEmail(form.getFrom());
        Optional<User> whom = usersRepository.findByEmail(form.getWhom());

        if (from.isPresent() && whom.isPresent()) {
            messageRepository.save(Message.builder()
                    .whom(whom.get())
                    .from(from.get())
                    .text(form.getText())
                    .build());
        }
    }
}
