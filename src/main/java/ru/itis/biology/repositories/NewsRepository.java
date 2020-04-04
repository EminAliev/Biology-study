package ru.itis.biology.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.biology.models.News;

public interface NewsRepository extends JpaRepository<News, Long> {
}
