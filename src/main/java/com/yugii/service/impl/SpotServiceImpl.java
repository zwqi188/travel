package com.yugii.service.impl;

import com.yugii.dao.SpotDao;
import com.yugii.entity.Spot;
import com.yugii.enums.ResponseEnums;
import com.yugii.exception.RespException;
import com.yugii.response.LeResponse;
import com.yugii.response.SpotResponse;
import com.yugii.service.SpotService;
import com.yugii.utils.JsonUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by mac on 2019/4/6.
 */
@Service("spotServiceImpl")
public class SpotServiceImpl implements SpotService{
    protected transient Logger log = Logger.getLogger(this.getClass());

    @Autowired
    private SpotDao spotDao;

    @Override
    @Transactional
    public LeResponse addSpot(Spot spot) {
        try {
            spot.setCreatedAt(new Date());
            spotDao.addSpot(spot);
            return LeResponse.success();
        } catch (Exception ex) {
            log.error("[addSpot]: save to dateBase error" + ex.getMessage());
            throw new RespException(ResponseEnums.ERROR_SAVE_TO_DATEBASE);
        }
    }

    @Override
    public LeResponse getRecommondSpot(String recommondType) {
        LeResponse response = LeResponse.success();
        List<Spot> spotList = new ArrayList<>();
        switch (recommondType){
            //错峰出游
            case "1":
                spotList = spotDao.findByPeakTravel();
                break;
            //精选特惠
            case "2":
                spotList = spotDao.findBySysRecommend();
                break;
            //亲子旅游
            case "3":
                spotList = spotDao.findByFamily();
                break;
            //最新上架
            case "4":
                spotList = spotDao.findByCreated();
                break;
        }

        response.setData(spotList);
        return response;
    }
}
