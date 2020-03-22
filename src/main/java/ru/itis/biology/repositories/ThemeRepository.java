package ru.itis.biology.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.biology.models.Theme;

public interface ThemeRepository extends JpaRepository<Theme, Long> {
}
