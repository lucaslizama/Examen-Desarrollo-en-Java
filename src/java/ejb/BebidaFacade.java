/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import db.Bebida;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author lucas
 */
@Stateless
public class BebidaFacade extends AbstractFacade<Bebida> {
    @PersistenceContext(unitName = "ExamenDEJPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BebidaFacade() {
        super(Bebida.class);
    }
    
}
