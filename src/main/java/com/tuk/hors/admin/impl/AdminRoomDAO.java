package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.vo.AdminInfo;
import com.tuk.hors.admin.vo.RoomInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminRoomDAO {
    int insertRoom(RoomInfo param);
}
