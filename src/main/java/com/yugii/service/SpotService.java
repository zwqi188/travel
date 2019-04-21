package com.yugii.service;

import com.yugii.entity.Spot;
import com.yugii.response.LeResponse;

/**
 * Created by mac on 2019/4/6.
 */
public interface SpotService {

    /**
     * 新增景点
     * @return
     */
    LeResponse addSpot(Spot spot);

    /**
     * 获取推荐景点
     * @param recommondType
     * @return
     */
    LeResponse getRecommondSpot(String recommondType);
}
