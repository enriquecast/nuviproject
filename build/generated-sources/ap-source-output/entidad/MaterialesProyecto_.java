package entidad;

import entidad.Materiales;
import entidad.Proyectos;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-27T12:27:59")
@StaticMetamodel(MaterialesProyecto.class)
public class MaterialesProyecto_ { 

    public static volatile SingularAttribute<MaterialesProyecto, Integer> idMaterialProyecto;
    public static volatile SingularAttribute<MaterialesProyecto, Float> valorTotal;
    public static volatile SingularAttribute<MaterialesProyecto, Materiales> fkMaterial;
    public static volatile SingularAttribute<MaterialesProyecto, Float> cantidadMaterial;
    public static volatile SingularAttribute<MaterialesProyecto, Proyectos> fkProyecto;
    public static volatile SingularAttribute<MaterialesProyecto, Float> valorUnitario;

}