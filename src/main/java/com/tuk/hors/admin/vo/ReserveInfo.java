package com.tuk.hors.admin.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveInfo extends RoomInfo{
    private Integer reservationId;
    private String userCode;
}