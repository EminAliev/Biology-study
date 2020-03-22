package ru.itis.biology.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.biology.models.User;

import java.util.List;
import java.util.stream.Collectors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDto {
    private Long id;
    private String name;
    private String fullname;
    private String email;
    private String imageUrl;
    private Integer age;
    private Integer classNumber;

    public static UserDto from(User user) {
        UserDto result = UserDto.builder()
                .email(user.getEmail())
                .name(user.getName())
                .fullname(user.getFullname())
                .age(user.getAge())
                .classNumber(user.getClassNumber())
                .id(user.getId())
                .build();

        if (user.getImage() != null) {
            result.imageUrl = "/files/" + user.getImage().getStorageFileName();
        }

        return result;
    }

    public static List<UserDto> from(List<User> users) {
        return users.stream()
                .map(UserDto::from)
                .collect(Collectors.toList());
    }
}
