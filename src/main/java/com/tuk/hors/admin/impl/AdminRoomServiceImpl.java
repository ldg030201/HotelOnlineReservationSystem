package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.service.AdminRoomService;
import com.tuk.hors.admin.service.AdminService;
import com.tuk.hors.admin.vo.AdminInfo;
import com.tuk.hors.admin.vo.RoomInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AdminRoomService")
public class AdminRoomServiceImpl implements AdminRoomService {
    @Autowired
    private AdminRoomDAO roomDAO;

    @Override
    public int regRoom(RoomInfo param) {
        return roomDAO.insertRoom(param);
    }
}
