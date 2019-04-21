package com.yugii.dao.Impl;

import com.yugii.dao.SpotDao;
import com.yugii.entity.Spot;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

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

    @Override
    public List<Spot> findByPeakTravel() {
        return null;
    }

    @Override
    @Transactional
    public List<Spot> findBySysRecommend() {
        try {
            String hql = "from Spot order by sysRecommend desc";
            return find(hql);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Spot> findByFamily() {
        return null;
    }

    @Override
    @Transactional
    public List<Spot> findByCreated() {
        try {
            String hql = "from Spot order by createdAt desc";
            return find(hql);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
