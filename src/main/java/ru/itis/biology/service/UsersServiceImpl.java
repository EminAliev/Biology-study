package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.models.User;
import ru.itis.biology.repositories.UsersRepository;
import ru.itis.biology.security.UserDetailsImpl;


import java.util.List;
import java.util.Optional;


@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository usersRepository;


    @Override
    public List<UserDto> getUsers() {
        List<User> users = usersRepository.findAll();
        return UserDto.from(users);
    }

    @Override
    public UserDto getConcreteUser(Long userId) {
        return UserDto.from(usersRepository.getOne(userId));
    }

    @Override
    public List<UserDto> search(String name) {
        return UserDto.from(usersRepository.findAllByNameContainsIgnoreCase(name));
    }

}
