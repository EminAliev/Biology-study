package ru.itis.biology.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.biology.models.FileInfo;


public interface FileInfoRepository extends JpaRepository<FileInfo, Long> {
    FileInfo findOneByStorageFileName(String storageFileName);
}
