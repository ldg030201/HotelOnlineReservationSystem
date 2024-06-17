package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.service.AdminService;
import com.tuk.hors.admin.vo.AdminInfo;
import com.tuk.hors.admin.vo.ReserveInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDAO adminDAO;

    @Override
    public AdminInfo login(AdminInfo param) {
        return adminDAO.selectAdminInfo(param);
    }
    @Override
    public List<ReserveInfo> getReserveList() {
        return adminDAO.selectReserveList();
    }
}
