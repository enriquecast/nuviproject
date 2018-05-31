
package facade;

import entidad.MaterialesProyecto;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


@Stateless
public class MaterialesProyectoFacade extends AbstractFacade<MaterialesProyecto> {

    @PersistenceContext(unitName = "Proyecto_NUViPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MaterialesProyectoFacade() {
        super(MaterialesProyecto.class);
    }

    public List<MaterialesProyecto> consultarMaterialesRequeridos(String codProyecto) {
        Query consulta = em.createNativeQuery("CALL listarMaterialesRequeridosString('" + codProyecto + "');", MaterialesProyecto.class);
        return consulta.getResultList();
    }

    public List<MaterialesProyecto> consultarMaterialesRequeridosSS(int codProyecto) {
        Query consulta = em.createNativeQuery("call listarMaterialesRequeridos(?1);", MaterialesProyecto.class);
        consulta.setParameter(1, codProyecto);
        return consulta.getResultList();
    }

    public List<Object[]> listarCostoMateriales(String codProyecto) {
        //Query consultaDatos = em.createNativeQuery("CALL sumarTotalesDos('"+codProyecto+"');");
        Query cons = em.createNativeQuery("CALL sumarTotales('"+codProyecto+"');");
        List<Object[]> listadoCosto = cons.getResultList();
        return listadoCosto;
    }

}
