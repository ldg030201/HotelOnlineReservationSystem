package com.tuk.hors.test.service.impl;

import com.tuk.hors.test.service.TestService;
import org.springframework.stereotype.Service;

@Service("TestService")
public class TestServiceImpl implements TestService {
    private final TestDAO testDAO;

    public TestServiceImpl(TestDAO testDAO) {
        this.testDAO = testDAO;
    }

    @Override
    public String selectTest() {
        return testDAO.selectTest() + " / testService";
    }
}
