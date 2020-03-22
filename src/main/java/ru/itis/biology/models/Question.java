package ru.itis.biology.models;


import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder()
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String content;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "question")
    private Set<Answer> answers = new HashSet<Answer>(0);

    @ManyToOne
    @JoinColumn(name = "theme_id")
    private Theme theme;
}
