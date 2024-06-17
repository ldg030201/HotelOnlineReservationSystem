package com.tuk.hors.admin.service;

import com.tuk.hors.admin.vo.AdminInfo;
import com.tuk.hors.admin.vo.ReserveInfo;

import java.util.List;

public interface AdminService {
    AdminInfo login(AdminInfo param);

    List<ReserveInfo> getReserveList();
}
