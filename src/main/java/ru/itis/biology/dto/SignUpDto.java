package ru.itis.biology.dto;

import lombok.Data;

@Data
public class SignUpDto {
    private String name;
    private String fullname;
    private Integer age;
    private Integer classNumber;
    private String email;
    private String password;
}
