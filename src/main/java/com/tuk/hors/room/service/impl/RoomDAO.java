package com.tuk.hors.room.service.impl;

import com.tuk.hors.room.DTO.ReviewDTO;
import com.tuk.hors.room.DTO.RoomDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RoomDAO {
    List<RoomDTO> selectRoomList(Map<String, Object> param);

    RoomDTO selectRoomInfo(Map<String, Object> param);

    RoomDTO selectRandomRoomInfo(Map<String, Object> param);

    void insertReservation(Map<String, Object> param);

    void deleteReservation(Map<String, Object> param);

    List<RoomDTO> selectUserReservationList(String userCode);

    void insertReview(Map<String, Object> param);

    ReviewDTO selectReviewInfo(Map<String, Object> param);
}
