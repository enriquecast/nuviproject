package entidad;

import entidad.Donador;
import entidad.Familias;
import entidad.Personal;
import entidad.Usuarios;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-27T12:27:59")
@StaticMetamodel(Tipodocumentos.class)
public class Tipodocumentos_ { 

    public static volatile SingularAttribute<Tipodocumentos, String> descripcion;
    public static volatile ListAttribute<Tipodocumentos, Usuarios> usuariosList;
    public static volatile SingularAttribute<Tipodocumentos, Integer> idTipoDocum;
    public static volatile ListAttribute<Tipodocumentos, Familias> familiasList;
    public static volatile ListAttribute<Tipodocumentos, Donador> donadorList;
    public static volatile SingularAttribute<Tipodocumentos, String> tipoDocum;
    public static volatile ListAttribute<Tipodocumentos, Personal> personalList;

}