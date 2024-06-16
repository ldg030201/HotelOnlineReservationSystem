package com.tuk.hors.room.service.impl;

import com.tuk.hors.room.DTO.RoomDTO;
import com.tuk.hors.room.service.RoomService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("RoomService")
public class RoomServiceImpl implements RoomService {
    private final RoomDAO roomDAO;

    public RoomServiceImpl(RoomDAO roomDAO) {
        this.roomDAO = roomDAO;
    }

    @Override
    public List<RoomDTO> selectRoomList(Map<String, Object> param) {
        return roomDAO.selectRoomList(param);
    }

    @Override
    public RoomDTO selectRoomInfo(Map<String, Object> param) {
        return roomDAO.selectRoomInfo(param);
    }

    @Override
    public RoomDTO selectRandomRoomInfo(Map<String, Object> param) {
        return roomDAO.selectRandomRoomInfo(param);
    }
}
