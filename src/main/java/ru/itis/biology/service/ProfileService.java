package ru.itis.biology.service;

import org.springframework.security.core.Authentication;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.models.User;

public interface ProfileService {
    UserDto getUserInformation(Authentication authentication);

    void editProfile(UserDto userDto, User user);
}