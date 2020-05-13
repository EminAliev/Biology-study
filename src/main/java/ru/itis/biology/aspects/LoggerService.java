package ru.itis.biology.aspects;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Date;


@Component
@Aspect
@Slf4j
public class LoggerService {
    @Before(value = "execution(* ru.itis.biology.service.SignUpServiceImpl.signUp(..))")
    public void logSignUp(JoinPoint joinPoint) {
        System.out.println("Registration attempt");
    }

    @Before(value = "execution(* ru.itis.biology.service.ConfirmServiceImpl.confirm(..))")
    public void logConfirm(JoinPoint joinPoint) {
        System.out.println("Confirm attempt");
    }

    @After(value = "execution(* ru.itis.biology.service.ProfileService.editProfile(..))")
    public void logUpdate(JoinPoint joinPoint) {
        System.out.println("Edit profile attempt");
    }

    @Before(value = "execution(* ru.itis.biology.service.CommentService.send(..))")
    public void logComment(JoinPoint joinPoint) {
        System.out.println("Try to send comment");
    }

    @Before(value = "execution(* ru.itis.biology.service.*.*(*))")
    public void logBefore(JoinPoint joinPoint) {
        System.out.println("Метод вызывается");
        Date date = new Date();
        System.out.println("Время: " + date);
        System.out.println("Сигнатура метода: " + joinPoint.getSignature());
        System.out.print("Аргументы метода: ");
        for (Object arguments : joinPoint.getArgs()) {
            System.out.print(arguments + "\t");
        }
        System.out.println("\n");
    }
}