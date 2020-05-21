package ru.itis.biology.schedulers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;
import ru.itis.biology.models.User;
import ru.itis.biology.repositories.UsersRepository;
import ru.itis.biology.service.EmailService;
import ru.itis.biology.service.UsersService;

import java.time.LocalDate;
import java.util.List;

@Configuration
@EnableScheduling
@Slf4j
public class StatisticSchedulers {
    @Autowired
    private EmailService emailService;

    @Autowired
    private UsersService usersService;

    @Transactional
    @Scheduled(cron = "0 0 10 * * *")
    public void run() {
        LocalDate dateBirthday = LocalDate.now();
        int month = dateBirthday.getMonthValue();
        int day = dateBirthday.getDayOfMonth();
        List<User> list = usersService.getUserbyMonthDay(month, day);
        if (!list.isEmpty()) {
            list.forEach(user -> {
                String message = "С днём рождения " + user.getName() + "!";
                emailService.sendMail("День рождения", message, user.getEmail());
            });
        }
    }
}

