package ru.itis.biology.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import ru.itis.biology.models.News;

import java.util.List;
import java.util.Optional;

public interface NewsService {

    List<News> findAllNews();

    Optional<News> findByID(Long id);


    void save(News news);

    void delete(News news);

}
