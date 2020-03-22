package ru.itis.biology.service;

import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.itis.biology.models.FileInfo;
import ru.itis.biology.models.User;
import ru.itis.biology.repositories.FileInfoRepository;
import ru.itis.biology.repositories.UsersRepository;
import ru.itis.biology.utils.FileStorageUtil;


import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 * 01.12.2017
 * FileStorageServiceImpl
 *
 * @author Sidikov Marsel (First Software Engineering Platform)
 * @version v1.0
 */
@Service
public class FileStorageServiceImpl implements FileStorageService {

    @Autowired
    private FileInfoRepository fileInfoRepository;

    @Autowired
    private FileStorageUtil fileStorageUtil;

    @Autowired
    private UsersRepository usersRepository;


    @Override
    public String saveFile(MultipartFile file) {
        FileInfo fileInfo = fileStorageUtil.convertFromMultipart(file);
        fileInfoRepository.save(fileInfo);
        fileStorageUtil.copyToStorage(file, fileInfo.getStorageFileName());
        return fileInfo.getStorageFileName();
    }

    @SneakyThrows
    @Override
    public void writeFileToResponse(String fileName, HttpServletResponse response) {
        FileInfo file = fileInfoRepository.findOneByStorageFileName(fileName);
        response.setContentType(file.getType());
        InputStream inputStream = new FileInputStream(new java.io.File(file.getUrl()));
        org.apache.commons.io.IOUtils.copy(inputStream, response.getOutputStream());
        response.flushBuffer();
    }

    @Override
    public String saveImage(Authentication authentication, MultipartFile file) {
        //imagesFilesValidator.validate(file);
        // TODO: проверять картинка или нет(в utils класс создать)
        FileInfo fileInfo = fileStorageUtil.convertFromMultipart(file);
        fileInfoRepository.save(fileInfo);
        fileStorageUtil.copyToStorage(file, fileInfo.getStorageFileName());
        User user = usersRepository.findByEmail(authentication.getName()).get();
        if (user.getImage() != null) {
            user.getImage().setUser(null);
            fileInfoRepository.save(user.getImage());
        }
        fileInfo.setUser(user);
        fileInfoRepository.save(fileInfo);
        return fileInfo.getStorageFileName();
    }
}
