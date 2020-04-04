package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import ru.itis.biology.models.News;
import ru.itis.biology.models.Question;
import ru.itis.biology.repositories.NewsRepository;

import java.util.List;
import java.util.Optional;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsRepository newsRepository;


    @Override
    public List<News> findAllNews() {
        return newsRepository.findAll();
    }

    @Override
    public Optional<News> findByID(Long id) {
        Optional<News> newsCandidate = newsRepository.findById(id);
        if (newsCandidate.isPresent()) {
            News news = newsCandidate.get();
            return Optional.of(news);
        } else {
            return Optional.empty();
        }
    }


    @Override
    public void save(News news) {
        newsRepository.save(news);
    }

    @Override
    public void delete(News news) {
        newsRepository.delete(news);
    }

}
