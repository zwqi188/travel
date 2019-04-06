package com.yugii.service;

import com.yugii.response.LeResponse;

/**
 * Created by mac on 2019/4/6.
 */
public interface SpotService {

    /**
     * 新增景点
     * @param spotName
     * @param cityId
     * @param price
     * @param spotImg
     * @param spotDesc
     * @return
     */
    LeResponse addSpot(String spotName, String cityId,
                       String price, String spotImg, String spotDesc);
}
