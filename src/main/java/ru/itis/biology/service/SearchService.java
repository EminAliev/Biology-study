package ru.itis.biology.service;

import ru.itis.biology.dto.NewsSearchDto;

public interface SearchService {
    NewsSearchDto searchNews(String query, Integer page, Integer size);
}
