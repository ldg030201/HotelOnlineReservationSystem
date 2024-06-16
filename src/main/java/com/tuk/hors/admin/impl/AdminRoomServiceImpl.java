package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.service.AdminRoomService;
import com.tuk.hors.admin.vo.RoomInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AdminRoomService")
public class AdminRoomServiceImpl implements AdminRoomService {
    @Autowired
    private AdminRoomDAO roomDAO;

    @Override
    public int regRoom(RoomInfo param) {
        return roomDAO.insertRoom(param);
    }

    @Override
    public List<RoomInfo> selectRoomList(){
        return roomDAO.selectRoomList();
    }
    @Override
    public RoomInfo selectRoomDetail(int roomId){
        return roomDAO.selectRoomDetail(roomId);
    }
    @Override
    public int updateRoom(RoomInfo param) {
        return roomDAO.updateRoom(param);
    }

}
