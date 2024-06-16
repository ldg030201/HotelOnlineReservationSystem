package com.tuk.hors.room.web;

import com.tuk.hors.room.service.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/room")
public class RoomController {
    private final RoomService roomService;

    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    @GetMapping("/list")
    public String list(Model model, Map<String, Object> param) {
        model.addAttribute("roomList", roomService.selectRoomList(param));

        return "room/list";
    }
}
