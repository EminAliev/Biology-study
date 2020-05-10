package ru.itis.biology.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.itis.biology.models.News;

public interface NewsRepository extends JpaRepository<News, Long> {
    @Query("from News news where " +
            "(upper(news.nameNews) like concat('%', upper(:query), '%') or " +
            "upper(news.text) like concat('%', upper(:query), '%')) ")
    Page<News> search(@Param("query") String query,
                      Pageable pageable);


}
