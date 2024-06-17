package com.tuk.hors.admin.service;

import com.tuk.hors.admin.vo.ReviewInfo;
import java.util.List;

public interface AdminReviewService {
    List<ReviewInfo> selectReviewList();
}
