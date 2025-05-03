/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.logging.Logger;
import javax.persistence.Entity;
import org.hibernate.annotations.NamedQuery;

/**
 *
 * @author FATI
 */
@Entity
@NamedQuery(name = "findAdminByEmail", query = "SELECT a FROM Admin a WHERE a.email = :email")

public class Admin extends User{

    public Admin() {
    }

    public Admin(String nom, String email, String motDePasse) {
        super(nom, email, motDePasse);
    }   
    
   
}
