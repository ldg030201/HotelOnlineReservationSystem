package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.vo.AdminInfo;
import com.tuk.hors.admin.vo.ReserveInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminDAO {
    AdminInfo selectAdminInfo(AdminInfo param);
    List<ReserveInfo> selectReserveList();
}
