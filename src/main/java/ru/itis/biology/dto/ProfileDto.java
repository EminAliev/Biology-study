package ru.itis.biology.dto;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Data
public class ProfileDto {
    @Email(message = "{errors.incorrect.email}")
    private String email;

    @NotNull(message = "{errors.null.age}")
    @Min(value = 0, message = "{errors.incorrect.age}")
    private Integer age;
}
