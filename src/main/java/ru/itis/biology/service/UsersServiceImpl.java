package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.models.Role;
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

    @Override
    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return getUserByAuthentication(authentication);
    }

    @Override
    public User getUserByAuthentication(Authentication authentication) {
        if (authentication == null) {
            return null;
        }
        UserDetailsImpl currentUserDetails = (UserDetailsImpl) authentication.getPrincipal();
        User currentUserModel = currentUserDetails.getUser();
        Long currentUserId = currentUserModel.getId();
        return usersRepository.findById(currentUserId).orElse(null);
    }

    @Override
    public User getAdmin() {
        Optional<User> userOptional = usersRepository.findByRole(Role.ADMIN);
        return userOptional.orElse(null);
    }

    @Override
    public List<User> getAllUser() {
        return usersRepository.findAll();
    }

    @Override
    public List<User> getUserbyMonthDay(int month, int day) {
        return usersRepository.findByDayBirthday(month, day);
    }
}
