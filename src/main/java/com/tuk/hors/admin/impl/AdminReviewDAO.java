package com.tuk.hors.admin.impl;

import com.tuk.hors.admin.vo.ReviewInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminReviewDAO {
    List<ReviewInfo> selectReviewList();
}
