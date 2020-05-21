package ru.itis.biology.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.itis.biology.models.Role;
import ru.itis.biology.models.User;

import java.util.List;
import java.util.Optional;

public interface UsersRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);

    Optional<User> findByConfirmCode(String confirmCode);

    List<User> findAllByNameContainsIgnoreCase(String name);

    Optional<User> findByRole(Role role);

    @Query(value = "SELECT * FROM users " +
            "WHERE email IS NOT NULL " +
            "AND extract(MONTH FROM birthday) = :m " +
            "AND extract(DAY FROM birthday) = :d",
            nativeQuery = true)
    List<User> findByDayBirthday(@Param("m") int month, @Param("d") int day);
}
