package com.tuk.hors.room.web;

import com.tuk.hors.room.service.RoomService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/room")
public class RoomController {
    private final RoomService roomService;

    @Value("${KAKAO_API_JS}")
    private String kakaoApiJs;

    @Value("${SERVER_IP}")
    private String serverIp;

    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    @GetMapping("/list")
    public String list(Model model, Map<String, Object> param, @SessionAttribute(name = "userCode", required = false) String userCode) {
        model.addAttribute("kakaoApiJs", kakaoApiJs);
        model.addAttribute("serverIp", serverIp);
        model.addAttribute("userCode", userCode);

        model.addAttribute("roomList", roomService.selectRoomList(param));

        return "room/list";
    }

    @GetMapping("/view")
    public String view(Model model, @SessionAttribute(name = "userCode", required = false) String userCode, @RequestParam Map<String, Object> param) {
        model.addAttribute("kakaoApiJs", kakaoApiJs);
        model.addAttribute("serverIp", serverIp);
        model.addAttribute("userCode", userCode);

        model.addAttribute("roomInfo", roomService.selectRoomInfo(param));
        model.addAttribute("randomInfo", roomService.selectRandomRoomInfo(param));

        return "room/view";
    }

    @ResponseBody
    @PostMapping("/reservation")
    public void reservation(@RequestParam Map<String, Object> param, @SessionAttribute(name = "userCode", required = false) String userCode) {
        if (userCode == null || userCode.isEmpty()) {
            throw new RuntimeException();
        }

        param.put("userCode", userCode);
        roomService.insertReservation(param);
    }
}
