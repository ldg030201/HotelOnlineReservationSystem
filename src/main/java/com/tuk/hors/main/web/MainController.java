package com.tuk.hors.main.web;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/main")
public class MainController {
    @Value("${KAKAO_API_JS}")
    private String kakaoApiJs;

    @Value("${SERVER_IP}")
    private String serverIp;

    @GetMapping("/main")
    public String main(Model model, @SessionAttribute(name = "userCode", required = false) String userCode) {
        model.addAttribute("kakaoApiJs", kakaoApiJs);
        model.addAttribute("serverIp", serverIp);
        model.addAttribute("userCode", userCode);

        return "main/main";
    }

    @GetMapping("/login")
    public String login(@RequestParam("code") String code, @SessionAttribute(name = "userCode", required = false) String userCode,
                        HttpServletRequest request) {
        if (userCode != null) {
            return "redirect:/main/main";
        }

        request.getSession().invalidate();
        HttpSession session = request.getSession(true);
        session.setAttribute("userCode", code);
        session.setMaxInactiveInterval(1800);

        return "redirect:/main/main";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }

        return "redirect:/main/main";
    }
}
