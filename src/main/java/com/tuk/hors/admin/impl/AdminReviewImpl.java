package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.service.AdminReviewService;
import com.tuk.hors.admin.vo.ReviewInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AdminReviewService")
public class AdminReviewImpl implements AdminReviewService {
    @Autowired
    private AdminReviewDAO adminReviewDAO;

    @Override
    public List<ReviewInfo> selectReviewList(){
        return adminReviewDAO.selectReviewList();
    }
}
