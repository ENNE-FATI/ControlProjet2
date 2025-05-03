/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.TouristeDao;
import dao.UserDao;
import entities.Touriste;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author FATI
 */
public class TouristeService implements IService<Touriste> {
    
    private final TouristeDao td;
    
    public TouristeService(){
        this.td = new TouristeDao();
    }

    @Override
    public List<Touriste> findAll() {
        return td.findAll();
    }

    @Override
    public Touriste findById(int id) {
        return td.findById(id);
    }

   @Override
    public boolean create(Touriste o) {
        return td.create(o);
    }

    @Override
    public boolean delete(Touriste o) {
        return td.delete(o);
    }

    @Override
    public boolean update(Touriste o) {
        return td.update(o);
    }
   public Touriste findTouristeByEmail(String email) {
    Session session = null;
    Transaction tx = null;
    Touriste touriste = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        System.out.println("Recherche touriste avec email : " + email);
        touriste = (Touriste) session.getNamedQuery("findTouristeByEmail")
                                   .setParameter("email", email)
                                   .uniqueResult();
        tx.commit();
        
        if (touriste != null) {
            System.out.println("Touriste trouvé : " + touriste.getEmail()); 
        } else {
            System.out.println("Aucun touriste trouvé avec l'email : " + email); 
        }
    } catch (HibernateException ex) {
        if (tx != null) {
            tx.rollback();
        }
        ex.printStackTrace();
    } finally {
        if (session != null) {
            session.close();
        }
    }
    return touriste;
}
}