package ru.itis.biology.service;

import org.springframework.security.core.Authentication;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;


public interface FileStorageService {
    // сохраняет файл на сервере
    String saveFile(MultipartFile file);
    // отправляет файл по запросу
    void writeFileToResponse(String fileName, HttpServletResponse response);

    String saveImage(Authentication authentication, MultipartFile file);
}
