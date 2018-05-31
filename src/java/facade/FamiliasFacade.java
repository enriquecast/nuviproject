
package facade;

import entidad.Familias;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Diego Alejandro
 */
@Stateless
public class FamiliasFacade extends AbstractFacade<Familias> {

    @PersistenceContext(unitName = "Proyecto_NUViPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FamiliasFacade() {
        super(Familias.class);
    }
    
    public List<Object[]> graficarProblematica() {
        Query q = em.createNativeQuery("SELECT problematicas.Problematica, COUNT(*) as Cantidad\n"
                + "	FROM FAMILIAS  JOIN problematicas\n"
                + "	ON problematicas.id_Problematica= familias.fk_Problematica \n"
                + "	GROUP BY problematicas.id_Problematica;");
        List<Object[]> listadoFamilias = q.getResultList();
        return listadoFamilias;
    }
    
}
