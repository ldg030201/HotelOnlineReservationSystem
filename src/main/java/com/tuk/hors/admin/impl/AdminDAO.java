package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.vo.AdminInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {
    AdminInfo selectAdminInfo(AdminInfo param);
}
