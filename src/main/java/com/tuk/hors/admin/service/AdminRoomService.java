package com.tuk.hors.admin.service;

import com.tuk.hors.admin.vo.RoomInfo;

import java.util.List;

public interface AdminRoomService {
    int regRoom(RoomInfo param);

    List<RoomInfo> selectRoomList();

    RoomInfo selectRoomDetail(int roomId);

    int updateRoom(RoomInfo param);
}
