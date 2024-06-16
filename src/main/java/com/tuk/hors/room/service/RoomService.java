package com.tuk.hors.room.service;

import com.tuk.hors.room.DTO.RoomDTO;

import java.util.List;
import java.util.Map;

public interface RoomService {
    List<RoomDTO> selectRoomList(Map<String, Object> param);
}
