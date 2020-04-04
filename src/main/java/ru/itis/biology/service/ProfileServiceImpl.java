package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import ru.itis.biology.dto.UserDto;
import ru.itis.biology.models.User;
import ru.itis.biology.repositories.UsersRepository;

@Service
public class ProfileServiceImpl implements ProfileService {

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public UserDto getUserInformation(Authentication authentication) {
        return UserDto.from(usersRepository.findByEmail(authentication.getName())
                .orElseThrow(IllegalArgumentException::new));
    }

    @Override
    public void editProfile(UserDto userDto, User user) {
        if (!userDto.getName().equals(""))
            user.setName(userDto.getName());
        else
            user.setName(user.getName());
        if (!userDto.getFullname().equals(""))
            user.setFullname(userDto.getFullname());
        else
            user.setFullname(user.getFullname());
        if (!userDto.getEmail().equals(""))
            user.setEmail(userDto.getEmail());
        else
            user.setEmail(user.getEmail());
        if (userDto.getClassNumber() != null)
            user.setClassNumber(userDto.getClassNumber());
        else
            user.setClassNumber(user.getClassNumber());
        if (userDto.getAge() != null)
            user.setAge(userDto.getAge());
        else
            user.setAge(user.getAge());
        if (!userDto.getPhone().equals(""))
            user.setPhone(userDto.getPhone());
        else
            user.setPhone(user.getPhone());

        usersRepository.save(user);
    }
}