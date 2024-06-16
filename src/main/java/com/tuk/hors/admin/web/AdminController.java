package com.tuk.hors.admin.web;

import com.tuk.hors.admin.service.AdminService;
import com.tuk.hors.admin.vo.AdminInfo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/admin/login")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @GetMapping("/login-page")
    public String loginPage(HttpServletRequest request) {
        HttpSession session = request.getSession();

        // 로그인 페이지 오픈
        if(null == session.getAttribute("adminId"))
            return "admin/login/login";
        else{
            return "admin/menu";
        }
    }

    @PostMapping ("/do-login")
    public String login(Model model, HttpServletRequest request) {
        String adminId = request.getParameter("adminId");
        String adminPw = request.getParameter("adminPw");

        AdminInfo param = new AdminInfo(adminId, adminPw);

        AdminInfo result = adminService.login(param);

        if(result == null) {
            model.addAttribute("result", "※ 아이디와 비밀번호를 다시 확인해 주세요.");
            return "admin/login/login";
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("adminId", result.getAdminId());
            return "admin/menu";
        }
    }
    @GetMapping ("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();

        return "admin/login/login";
    }
}
