package com.tuk.hors.test.web;

import com.tuk.hors.test.service.TestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
    private final TestService testService;

    public TestController(TestService testService) {
        this.testService = testService;
    }

    @GetMapping("/t")
    public String test(Model model) {
        model.addAttribute("test", testService.selectTest());
        return "test";
    }
}
