package com.tuk.hors.room.DTO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ReviewDTO {
    private Integer reviewId;
    private Integer roomId;
    private Integer reviewScore;
    private String reviewContent;
}
