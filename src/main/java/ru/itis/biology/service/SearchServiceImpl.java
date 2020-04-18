package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import ru.itis.biology.dto.NewsSearchDto;
import ru.itis.biology.models.News;
import ru.itis.biology.repositories.NewsRepository;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private NewsRepository newsRepository;

    @Override
    public NewsSearchDto searchNews(String query, Integer page, Integer size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        Page<News> pageResult = newsRepository.search(query, pageRequest);
        return NewsSearchDto.builder()
                .pagesCount(pageResult.getTotalPages())
                .news(pageResult.getContent())
                .build();
    }

}
