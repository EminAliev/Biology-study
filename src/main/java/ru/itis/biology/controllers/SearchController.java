package ru.itis.biology.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.itis.biology.dto.NewsSearchDto;
import ru.itis.biology.service.SearchService;

@RestController
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private SearchService searchService;

    @GetMapping("/news")
    public NewsSearchDto searchNews(@RequestParam("q") String query,
                                    @RequestParam("page") Integer page,
                                    @RequestParam("size") Integer size) {
        return searchService.searchNews(query, page, size);

    }
}