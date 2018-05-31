package controlador;

import entidad.Proyectos;
import entidad.Seguimiento;
import entidad.Visita;
import facade.ProyectosFacade;
import facade.VisitaFacade;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import org.primefaces.PrimeFaces;

@Named(value = "visitaControlador")
@SessionScoped
public class VisitaControlador implements Serializable {

    private Visita visita = new Visita();
    private Proyectos proyectos = new Proyectos();
    private Seguimiento seguimiento = new Seguimiento();
    Email email = new Email();
    @EJB
    VisitaFacade visitaFacade;
    @EJB
    ProyectosFacade proyectosFacade;

    public VisitaControlador() {

    }

    //GETTER AND SETTER
    public Visita getVisita() {
        return visita;
    }

    public void setVisita(Visita visita) {
        this.visita = visita;
    }

    public Proyectos getProyectos() {
        return proyectos;
    }

    public void setProyectos(Proyectos proyectos) {
        this.proyectos = proyectos;
    }

    public Seguimiento getSeguimiento() {
        return seguimiento;
    }

    public void setSeguimiento(Seguimiento seguimiento) {
        this.seguimiento = seguimiento;
    }

    //FIN GETTER AND SETTER
    public List<Visita> listarVisitas() {
        return visitaFacade.findAll();
    }

    public String registrarVisita() {
        //System.out.println(proyectos);
        //seguimiento.setFkProyecto(proyectosFacade.find(getProyectos()));

        //seguimiento.setFkVisita(visitaFacade.find(visita.getIdVisita()));
        visitaFacade.create(visita);
        visita = new Visita();
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Registro correcto", "Visita agendada");
        PrimeFaces.current().dialog().showMessageDynamic(message);
        Email e2 = new Email("nuviproject@gmail.com", "proyectosena", "alejandrohuertas1992@gmail.com", "da236@misena.edu.co");
        e2.enviarSimple("Confirmación de visita","Se ha programado una visita para realizar el seguimiento.");
        return "";
    }
    
    public String editarVisita(Visita objVisita){
        visita = objVisita;
        visitaFacade.edit(visita);
        return "EditarVisita";
    }
    
    public String actualizarVisita(){
        visitaFacade.edit(visita);
        return "ListaVisitas";
    }

}
