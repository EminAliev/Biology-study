package ru.itis.biology.service;


import org.springframework.security.core.Authentication;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.models.User;

import java.util.List;
import java.util.Optional;

public interface UsersService {
    List<UserDto> getUsers();

    UserDto getConcreteUser(Long userId);

    List<UserDto> search(String name);

    User getCurrentUser();

    User getUserByAuthentication(Authentication authentication);

    User getAdmin();

    List<User> getAllUser();

}
