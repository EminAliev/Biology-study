package ru.itis.biology.service;

import ru.itis.biology.models.User;

import java.util.List;

public interface AdminService {
    List<User> getAllUsers();
}
