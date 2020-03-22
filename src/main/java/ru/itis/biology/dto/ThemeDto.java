package ru.itis.biology.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.biology.models.Theme;

import java.util.List;
import java.util.stream.Collectors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ThemeDto {
    private Long id;
    private String nameTheme;
    private String textTheme;

    public static ThemeDto from(Theme theme) {
        ThemeDto result = ThemeDto.builder()
                .id(theme.getId())
                .nameTheme(theme.getNameTheme())
                .textTheme(theme.getTextTheme())
                .build();
        return result;
    }

    public static List<ThemeDto> from(List<Theme> themes) {
        return themes.stream()
                .map(ThemeDto::from)
                .collect(Collectors.toList());
    }
}
