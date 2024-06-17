package com.tuk.hors.admin.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewInfo extends RoomInfo{
    private Integer reviewId;
    private Integer reviewScore;
    private String reviewContent;

}