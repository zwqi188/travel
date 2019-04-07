package com.yugii.service.impl;

import com.yugii.dao.SpotDao;
import com.yugii.entity.Spot;
import com.yugii.response.LeResponse;
import com.yugii.service.SpotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;

/**
 * Created by mac on 2019/4/6.
 */
@Service("spotServiceImpl")
public class SpotServiceImpl implements SpotService{

    @Autowired
    private SpotDao spotDao;

    @Override
    @Transactional
    public LeResponse addSpot(String spotName, String cityId, String price, String spotImg, String spotDesc) {
        Spot spot = new Spot();
        spot.setSpotName(spotName);
        spot.setCityId(cityId);
        spot.setPrice(price);
        spot.setSpotImg(spotImg);
        spot.setSpotDesc(spotDesc);
        spot.setCreatedAt(new Date());
        spotDao.addSpot(spot);
        return LeResponse.success();
    }
}
