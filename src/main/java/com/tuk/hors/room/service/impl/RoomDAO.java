package com.tuk.hors.room.service.impl;

import com.tuk.hors.room.DTO.RoomDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RoomDAO {
    List<RoomDTO> selectRoomList(Map<String, Object> param);
}
