package entidad;

import entidad.Usuarios;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-27T12:27:59")
@StaticMetamodel(Casos.class)
public class Casos_ { 

    public static volatile SingularAttribute<Casos, String> calificacion;
    public static volatile SingularAttribute<Casos, Usuarios> fkUsuario;
    public static volatile SingularAttribute<Casos, Integer> idCaso;
    public static volatile SingularAttribute<Casos, String> detalleProblema;
    public static volatile SingularAttribute<Casos, String> emailUsuario;
    public static volatile SingularAttribute<Casos, String> detalleSolucion;
    public static volatile SingularAttribute<Casos, String> nombreUsuario;
    public static volatile SingularAttribute<Casos, String> estadoCaso;

}