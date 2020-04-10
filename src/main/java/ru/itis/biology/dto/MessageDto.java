package ru.itis.biology.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.biology.models.Message;

import java.util.List;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MessageDto {
    private String text;
    private String from;
    private String whom;

    public static MessageDto from(Message message) {
        return MessageDto.builder()
                .from(message.getFrom().getEmail())
                .whom(message.getWhom().getEmail())
                .text(message.getText())
                .build();
    }

    public static List<MessageDto> from(List<Message> messages) {
        return messages.stream()
                .map(MessageDto::from)
                .collect(Collectors.toList());
    }
}

