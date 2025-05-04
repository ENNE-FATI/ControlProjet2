/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.ActivityTouristeDao;
import entities.ActiviteTouristique;
import java.util.ArrayList;
import java.util.List;
import mapper.ActiviteLieuCount;

/**
 *
 * @author FATI
 */
public class ActivityService implements IService<ActiviteTouristique> {

    private final ActivityTouristeDao activityDao;

    public ActivityService() {
        this.activityDao = new ActivityTouristeDao();
    }

    @Override
    public boolean create(ActiviteTouristique o) {
        return activityDao.create(o);
    }

    @Override
    public boolean update(ActiviteTouristique o) {
        return activityDao.update(o);
    }

    @Override
    public boolean delete(ActiviteTouristique o) {
        return activityDao.delete(o);
    }

    @Override
    public List<ActiviteTouristique> findAll() {
        return activityDao.findAll();
    }

    @Override
    public ActiviteTouristique findById(int id) {
        return activityDao.findById(id);
    }
    
    public List<ActiviteLieuCount> getReservationsByLieu() {
        List<Object[]> results = activityDao.countReservationsByLieu();
        List<ActiviteLieuCount> stats = new ArrayList<>();
        for (Object[] row : results) {
            stats.add(new ActiviteLieuCount((String) row[0], (Long) row[1]));
        }
        return stats;
    }
    
}
