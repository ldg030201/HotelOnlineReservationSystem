package com.tuk.hors.main.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
    @Value("${KAKAO_API_JS}")
    private String kakaoApiJs;

    @GetMapping("/main")
    public String main(Model model) {
        model.addAttribute("kakaoApiJs", kakaoApiJs);

        return "main/main";
    }
}
