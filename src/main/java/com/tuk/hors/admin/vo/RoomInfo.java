package com.tuk.hors.admin.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class RoomInfo {
    private Integer roomId;
    private String roomName;
    private Integer roomPrice;
    private Integer numPerson;
    private Integer roomDesc;
    private String roomImgUrl;
    private MultipartFile imgFile;

}
