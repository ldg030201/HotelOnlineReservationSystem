package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.vo.RoomInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminRoomDAO {
    int insertRoom(RoomInfo param);
    List<RoomInfo> selectRoomList();

    RoomInfo selectRoomDetail(int roomId);
    int updateRoom(RoomInfo param);
}
