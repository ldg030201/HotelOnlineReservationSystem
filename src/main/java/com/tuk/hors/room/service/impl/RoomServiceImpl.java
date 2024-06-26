package com.tuk.hors.room.service.impl;

import com.tuk.hors.room.DTO.ReviewDTO;
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

    @Override
    public void insertReservation(Map<String, Object> param) {
        roomDAO.insertReservation(param);
    }

    @Override
    public void deleteReservation(Map<String, Object> param) {
        roomDAO.deleteReservation(param);
    }

    @Override
    public List<RoomDTO> selectUserReservationList(String userCode) {
        return roomDAO.selectUserReservationList(userCode);
    }

    @Override
    public void insertReview(Map<String, Object> param) {
        roomDAO.insertReview(param);
    }

    @Override
    public ReviewDTO selectReviewInfo(Map<String, Object> param) {
        return roomDAO.selectReviewInfo(param);
    }
}
