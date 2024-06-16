package com.tuk.hors.admin.web;

import org.springframework.ui.Model;
import com.tuk.hors.admin.service.AdminRoomService;
import com.tuk.hors.admin.vo.RoomInfo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

@Controller
@Slf4j
@RequestMapping("/admin/room")
public class AdminRoomController {


    @Value("${SERVER_IP}")
    private String serverIp;

    @Autowired
    private AdminRoomService adminRoomService;
    @GetMapping("/reg")
    public String regPage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(null == session.getAttribute("adminId"))
            return "admin/login/login";
        else{
            return "admin/room/regRoom";
        }
    }

    @GetMapping("/list")
    public String roomListPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();

        List<RoomInfo> list = adminRoomService.selectRoomList();
        model.addAttribute("roomList",list);

        if(null == session.getAttribute("adminId"))
            return "admin/login/login";
        else{
            return "admin/room/roomList";
        }
    }

    @PostMapping("/reg")
    public String regRoom(HttpServletRequest request,
                          @ModelAttribute RoomInfo param) {
        HttpSession session = request.getSession();

        log.info(param.getImgFile().getOriginalFilename());

        MultipartFile file = param.getImgFile();

        String originalFilename = file.getOriginalFilename();
        String saveFileName = createSaveFileName(originalFilename);

        String path = request.getServletContext().getRealPath("/");
        String uploadFolder  = path+ "saveImg\\";
        try {
            file.transferTo(new File(getFullPath(uploadFolder, saveFileName)));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        param.setRoomImgUrl(saveFileName);


        adminRoomService.regRoom(param);


        if(null == session.getAttribute("adminId"))
            return "admin/login/login";
        else{
            return "admin/room/regSuccess";
        }
    }
    private String createSaveFileName(String originalFilename) {
        String ext = extractExt(originalFilename);
        String uuid = UUID.randomUUID().toString();
        return uuid + "." + ext;
    }

    // 확장자명 구하기
    private String extractExt(String originalFilename) {
        int pos = originalFilename.lastIndexOf(".");
        return originalFilename.substring(pos + 1);
    }

    // fullPath 만들기
    private String getFullPath(String uploadPath, String filename) {
        return uploadPath + filename;
    }
}
