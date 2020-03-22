package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import ru.itis.biology.dto.UserDto;
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
}