package ru.itis.biology.service;

public interface EmailService {
    void sendMail(String subject, String text, String email);
}
