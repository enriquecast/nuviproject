
package controlador;

import entidad.MaterialesProyecto;
import entidad.Proyectos;
import facade.MaterialesProyectoFacade;
import facade.ProyectosFacade;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;

@Named(value = "consultasControlador")
@SessionScoped
public class ConsultasControlador implements Serializable {

    private int codProyecto;
    Proyectos proyectos = new Proyectos();
    
    @EJB
    MaterialesProyectoFacade materialesProyectoFacade;
    
    public ConsultasControlador() {
    }

    public Proyectos getProyectos() {
        return proyectos;
    }

    public void setProyectos(Proyectos proyectos) {
        this.proyectos = proyectos;
    }
    
    public int getCodProyecto() {
        return codProyecto;
    }

    public void setCodProyecto(int codProyecto) {
        this.codProyecto = codProyecto;
    }
    
    
}
