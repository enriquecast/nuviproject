package entidad;

import entidad.Permisos;
import entidad.Roles;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-27T12:27:59")
@StaticMetamodel(Permisos.class)
public class Permisos_ { 

    public static volatile ListAttribute<Permisos, Roles> rolesList;
    public static volatile SingularAttribute<Permisos, Permisos> permisopadre;
    public static volatile SingularAttribute<Permisos, Integer> idPermiso;
    public static volatile SingularAttribute<Permisos, String> icon;
    public static volatile ListAttribute<Permisos, Permisos> permisosList;
    public static volatile SingularAttribute<Permisos, String> nombrePermiso;
    public static volatile SingularAttribute<Permisos, String> url;

}