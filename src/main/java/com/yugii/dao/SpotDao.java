package com.yugii.dao;

import com.yugii.entity.Spot;

import java.util.List;

/**
 * Created by mac on 2019/4/6.
 */
public interface SpotDao {

    void addSpot(Spot spot);

    List<Spot> findByPeakTravel();

    List<Spot> findBySysRecommend();

    List<Spot> findByFamily();

    List<Spot> findByCreated();
}
