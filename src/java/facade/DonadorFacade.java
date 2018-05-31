/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import entidad.Donador;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Diego Alejandro
 */
@Stateless
public class DonadorFacade extends AbstractFacade<Donador> {

    @PersistenceContext(unitName = "Proyecto_NUViPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DonadorFacade() {
        super(Donador.class);
    }
    
}
