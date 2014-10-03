/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.passiba.autoruletti.drivers.beans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.passiba.autoruletti.entities.Drivers;

/**
 *
 * @author pauline
 */
@Stateless
public class DriversFacade extends AbstractFacade<Drivers> {
    @PersistenceContext(unitName = "org.passiba_Autoruletti2_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DriversFacade() {
        super(Drivers.class);
    }
    
}
