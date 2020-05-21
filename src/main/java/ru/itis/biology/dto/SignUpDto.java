package ru.itis.biology.dto;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Data
public class SignUpDto {

    @NotNull(message = "Напишите свое имя")
    @Pattern(regexp = "[А-Яа-я]+", message = "Неправильное имя")
    private String name;

    @NotNull(message = "Напишите свою фамилию")
    @Pattern(regexp = "[А-Яа-я]+", message = "Неправильная фамилия")
    private String fullname;

    @NotNull(message = "Неправильный возраст")
    private Integer age;

    @NotNull(message = "Неправильный класс")
    private Integer classNumber;

    @NotNull(message = "Напишите свое email")
    @Email(message = "Неправильный email")
    private String email;

    @NotNull(message = "Напишите свой пароль")
    private String password;

    @NotNull(message = "Напишите свой номер телефон")
    @Pattern(regexp = "^\\+\\d{2}\\(\\d{3}\\)\\d{3}-\\d{2}-\\d{2}$", message = "Неправильный формат номера телефона")
    private String phone;

    @NotNull(message = "Напишите свою роль")
    private String role;

    @NotNull(message = "Напишите вашу дату рождения")
    private LocalDate birthday;
}
