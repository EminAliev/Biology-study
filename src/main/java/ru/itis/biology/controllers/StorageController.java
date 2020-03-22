package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.itis.biology.service.FileStorageService;

import javax.servlet.http.HttpServletResponse;


@Controller
public class StorageController {

    @Autowired
    private FileStorageService service;

    @GetMapping("/storage")
    public String getStoragePage() {
        return "file_upload";
    }


    /*@PostMapping("/files")
    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file) {
        String filePath = service.saveFile(file);
        return ResponseEntity
                .ok()
                .body(filePath);
    }*/

    @PostMapping(value = "/files")
    @ResponseBody
    public String handleImageUpload(@RequestParam("file") MultipartFile file,
                                    Authentication authentication) {
        return service.saveImage(authentication, file);
    }


    // URL-для получения файла
    @GetMapping("/files/{file-name:.+}")
    public void getFile(@PathVariable("file-name") String fileName,
                        HttpServletResponse response) {
        // запись файла в ответ
        service.writeFileToResponse(fileName, response);
    }
}
