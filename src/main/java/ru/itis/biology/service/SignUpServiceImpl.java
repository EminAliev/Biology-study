package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import ru.itis.biology.dto.SignUpDto;
import ru.itis.biology.models.Role;
import ru.itis.biology.models.State;
import ru.itis.biology.models.User;
import ru.itis.biology.repositories.UsersRepository;


import java.time.LocalDateTime;
import java.util.UUID;
import java.util.concurrent.ExecutorService;

@Component
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private EmailService emailService;

    @Autowired
    private SmsService smsService;

    @Autowired
    private ExecutorService executorService;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public void signUp(SignUpDto form) {
        String rawPassword = form.getPassword();
        String hashPassword = passwordEncoder.encode(rawPassword);

        User user = User.builder()
                .email(form.getEmail())
                .hashPassword(hashPassword)
                .name(form.getName())
                .fullname(form.getFullname())
                .age(form.getAge())
                .classNumber(form.getClassNumber())
                .phone(form.getPhone())
                .createdAt(LocalDateTime.now())
                .state(State.NOT_CONFIRMED)
                .role(Role.valueOf(form.getRole()))
                .confirmCode(UUID.randomUUID().toString())
                .build();

        usersRepository.save(user);

        executorService.submit(() -> {
            emailService.sendMail("Регистрация", "Привет, " + user.getName()
                    + ". " + "Для подтверждения вашего email адреса пройдите по ссылке " + "http://localhost:8080/confirm/" + user.getConfirmCode(), user.getEmail());
        });

        smsService.send(form);

    }
}
