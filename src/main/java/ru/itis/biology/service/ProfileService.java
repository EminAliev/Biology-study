package ru.itis.biology.service;

import org.springframework.security.core.Authentication;
import ru.itis.biology.dto.UserDto;

public interface ProfileService {
    UserDto getUserInformation(Authentication authentication);
}