/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import entidad.Materiales;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Diego Alejandro
 */
@Stateless
public class MaterialesFacade extends AbstractFacade<Materiales> {

    @PersistenceContext(unitName = "Proyecto_NUViPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MaterialesFacade() {
        super(Materiales.class);
    }
    
}
