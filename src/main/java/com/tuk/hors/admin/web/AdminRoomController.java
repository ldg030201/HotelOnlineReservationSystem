package com.tuk.hors.admin.web;

import com.tuk.hors.admin.service.AdminRoomService;
import com.tuk.hors.admin.service.AdminService;
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

    @PostMapping("/reg")
    public String regRoom(HttpServletRequest request,
                          @ModelAttribute RoomInfo param) {
        HttpSession session = request.getSession();

        log.info(param.getImgFile().getOriginalFilename());

        MultipartFile file = param.getImgFile();

        ZonedDateTime now = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");

        String path = request.getServletContext().getRealPath("/");
        String uploadFolder  = path+ "/saveImg/";

        File dir = new File(uploadFolder);

        if (!dir.exists() || !dir.isDirectory()) {
            dir.mkdirs();
        }
        if (!file.isEmpty()) {
            String originalFileName = file.getOriginalFilename();
            try {
                file.transferTo(new File(dir+originalFileName));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            String fileExtension = "";
            fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
            String uploadFileName = "";
            uploadFileName = now.format(format) + "." + fileExtension;
            param.setRoomImgUrl(uploadFileName);

            File fileRename = new File(uploadFolder, uploadFileName);
            File saveFile = new File(uploadFolder, originalFileName);

            saveFile.renameTo(fileRename);

            try {
                file.transferTo(saveFile);
            } catch (Exception e) {
                log.error(e.getMessage());
            }

        }
        adminRoomService.regRoom(param);


        if(null == session.getAttribute("adminId"))
            return "admin/login/login";
        else{
            return "admin/menu";
        }
    }
}
