package ru.itis.biology.service;

import ru.itis.biology.dto.SignUpDto;
import ru.itis.biology.models.User;

import java.util.concurrent.Future;

public interface SmsService {
    Future<Boolean> send(SignUpDto form);
}
