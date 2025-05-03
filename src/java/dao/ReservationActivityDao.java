/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import entities.ActiviteTouristique;
import entities.ReservationActivity;
import entities.Touriste;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;


/**
 *
 * @author FATI
 */
public class ReservationActivityDao extends AbstractDao<ReservationActivity> {

    public ReservationActivityDao() {
        super(ReservationActivity.class);
    }
  public List<Object[]> findNamesByDate(LocalDate date) {
    Session session = null;
    Transaction tx = null;
    List<Object[]> results = null;

    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();

        results = session.getNamedQuery("findNamesByDate")
                         .setParameter("date", date)
                         .list();

        tx.commit();
    } catch (Exception ex) {
        if (tx != null) tx.rollback();
        ex.printStackTrace();
    } finally {
        if (session != null) session.close();
    }

    return results;
}
 public List<ReservationActivity> findByTouriste(Touriste touriste) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            
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

    public List<ReservationActivity> findByActivite(ActiviteTouristique activite) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            
            List<ReservationActivity> result = session
                .getNamedQuery("ReservationActivity.findByActivite")
                .setParameter("activite", activite)
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

    public List<ReservationActivity> findByDate(LocalDate date) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            
            List<ReservationActivity> result = session
                .getNamedQuery("ReservationActivity.findByDate")
                .setParameter("date", date)
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

    public List<ReservationActivity> findByActiviteAndDate(ActiviteTouristique activite, LocalDate date) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            
            List<ReservationActivity> result = session
                .getNamedQuery("ReservationActivity.findByActiviteAndDate")
                .setParameter("activite", activite)
                .setParameter("date", date)
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

