package entidad;

import entidad.Donaciones;
import entidad.Familias;
import entidad.MaterialesProyecto;
import entidad.Personal;
import entidad.ProyectosUsuarios;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-27T12:27:59")
@StaticMetamodel(Proyectos.class)
public class Proyectos_ { 

    public static volatile SingularAttribute<Proyectos, Integer> idProyecto;
    public static volatile SingularAttribute<Proyectos, Float> dineroRecaudado;
    public static volatile SingularAttribute<Proyectos, Float> costoPersonal;
    public static volatile SingularAttribute<Proyectos, Familias> fkFamilia;
    public static volatile SingularAttribute<Proyectos, Date> fechaFinProyecto;
    public static volatile SingularAttribute<Proyectos, Float> costoMaterial;
    public static volatile ListAttribute<Proyectos, Donaciones> donacionesList;
    public static volatile SingularAttribute<Proyectos, String> nombreProyecto;
    public static volatile SingularAttribute<Proyectos, String> solucionProyecto;
    public static volatile SingularAttribute<Proyectos, String> estadoProyecto;
    public static volatile SingularAttribute<Proyectos, Float> costoProyecto;
    public static volatile SingularAttribute<Proyectos, String> imgCierreProyecto;
    public static volatile ListAttribute<Proyectos, Personal> personalList;
    public static volatile ListAttribute<Proyectos, ProyectosUsuarios> proyectosUsuariosList;
    public static volatile SingularAttribute<Proyectos, Date> fechaInicioProyecto;
    public static volatile SingularAttribute<Proyectos, String> codProyecto;
    public static volatile SingularAttribute<Proyectos, Integer> cantidadVoluntarios;
    public static volatile ListAttribute<Proyectos, MaterialesProyecto> materialesProyectoList;

}