package com.tuk.hors.admin.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminInfo {
    private String adminId;
    private String adminPw;
    private String adminNm;

    public AdminInfo(String adminId, String adminPw) {
        this.adminId = adminId;
        this.adminPw = adminPw;
    }
}