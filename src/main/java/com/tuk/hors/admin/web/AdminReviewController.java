package com.tuk.hors.admin.web;

import com.tuk.hors.admin.service.AdminReviewService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminReviewController {

    @Autowired
    private AdminReviewService adminReviewService;
    @GetMapping("/review")
    public String loginPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();

        model.addAttribute("reviewList", adminReviewService.selectReviewList());

        // 로그인 페이지 오픈
        if(null == session.getAttribute("adminId"))
            return "admin/login/login";
        else{
            return "admin/review/review";
        }
    }
}
