package com.yugii.dao.Impl;

import com.yugii.dao.SpotDao;
import com.yugii.entity.Spot;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

/**
 * Created by mac on 2019/4/6.
 */
@Repository
public class SpotDaoImpl extends BaseDAO<Spot> implements SpotDao {

    @Override
    public void addSpot(Spot spot) {
        try {
            save(spot);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
