/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Admin;

/**
 *
 * @author FATI
 */
public class AdminDao extends AbstractDao<Admin> {

    public AdminDao() {
        super(Admin.class);
    }

    public Admin findByEmail(String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}