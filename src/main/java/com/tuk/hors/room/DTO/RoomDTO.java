package com.tuk.hors.room.DTO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class RoomDTO {
    private Integer roomId;
    private String roomName;
    private Integer roomPrice;
    private String roomDesc;
    private String roomImgUrl;
}
