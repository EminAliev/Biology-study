package ru.itis.biology.aspects;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;


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
}