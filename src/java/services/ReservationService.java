/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.ReservationActivityDao;
import entities.ReservationActivity;
import entities.Touriste;
import java.util.Collections;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author pc
 */
public class ReservationService implements IService<ReservationActivity> {
    
    private final ReservationActivityDao rd;

    public ReservationService() {
        this.rd = new ReservationActivityDao();
    }
    
    

    @Override
    public boolean create(ReservationActivity o) {
        return rd.create(o);
    }

    @Override
    public boolean delete(ReservationActivity o) {
         return rd.delete(o);
    }

    @Override
    public boolean update(ReservationActivity o) {
         return rd.update(o);
    }

    @Override
    public List<ReservationActivity> findAll() {
       return rd.findAll(); 
    }

    @Override
    public ReservationActivity findById(int id) {
        return rd.findById(id); 
    }

    public List<ReservationActivity> findByTouriste(Touriste touriste) {
    Session session = null;
    Transaction tx = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        
        // Utilisation du named query défini dans l'entité ReservationActivity
        List<ReservationActivity> result = session
            .getNamedQuery("ReservationActivity.findByTouriste")
            .setParameter("touriste", touriste)
            .list();
        
        tx.commit();
        return result;
    } catch (Exception ex) {
        if (tx != null) tx.rollback();
        ex.printStackTrace();
        return Collections.emptyList();
    } finally {
        if (session != null) session.close();
    }
}
    
}
