package entidad;

import entidad.Proyectos;
import entidad.Usuarios;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-27T12:27:59")
@StaticMetamodel(ProyectosUsuarios.class)
public class ProyectosUsuarios_ { 

    public static volatile SingularAttribute<ProyectosUsuarios, Usuarios> fkUsuario;
    public static volatile SingularAttribute<ProyectosUsuarios, Integer> idProyectoUsuario;
    public static volatile SingularAttribute<ProyectosUsuarios, Proyectos> fkProyecto;

}