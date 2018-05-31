/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidad;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Diego Leguizamon
 */
@Entity
@Table(name = "casos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Casos.findAll", query = "SELECT c FROM Casos c")
    , @NamedQuery(name = "Casos.findByIdCaso", query = "SELECT c FROM Casos c WHERE c.idCaso = :idCaso")
    , @NamedQuery(name = "Casos.findByNombreUsuario", query = "SELECT c FROM Casos c WHERE c.nombreUsuario = :nombreUsuario")
    , @NamedQuery(name = "Casos.findByEmailUsuario", query = "SELECT c FROM Casos c WHERE c.emailUsuario = :emailUsuario")
    , @NamedQuery(name = "Casos.findByDetalleProblema", query = "SELECT c FROM Casos c WHERE c.detalleProblema = :detalleProblema")
    , @NamedQuery(name = "Casos.findByDetalleSolucion", query = "SELECT c FROM Casos c WHERE c.detalleSolucion = :detalleSolucion")
    , @NamedQuery(name = "Casos.findByEstadoCaso", query = "SELECT c FROM Casos c WHERE c.estadoCaso = :estadoCaso")
    , @NamedQuery(name = "Casos.findByCalificacion", query = "SELECT c FROM Casos c WHERE c.calificacion = :calificacion")})
public class Casos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_Caso")
    private Integer idCaso;
    @Size(max = 45)
    @Column(name = "Nombre_Usuario")
    private String nombreUsuario;
    @Size(max = 45)
    @Column(name = "Email_Usuario")
    private String emailUsuario;
    @Size(max = 300)
    @Column(name = "Detalle_Problema")
    private String detalleProblema;
    @Size(max = 300)
    @Column(name = "Detalle_Solucion")
    private String detalleSolucion;
    @Size(max = 30)
    @Column(name = "Estado_Caso")
    private String estadoCaso;
    @Size(max = 2)
    @Column(name = "Calificacion")
    private String calificacion;
    @JoinColumn(name = "fk_Usuario", referencedColumnName = "id_Usuario")
    @ManyToOne
    private Usuarios fkUsuario;

    public Casos() {
    }

    public Casos(Integer idCaso) {
        this.idCaso = idCaso;
    }

    public Integer getIdCaso() {
        return idCaso;
    }

    public void setIdCaso(Integer idCaso) {
        this.idCaso = idCaso;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getDetalleProblema() {
        return detalleProblema;
    }

    public void setDetalleProblema(String detalleProblema) {
        this.detalleProblema = detalleProblema;
    }

    public String getDetalleSolucion() {
        return detalleSolucion;
    }

    public void setDetalleSolucion(String detalleSolucion) {
        this.detalleSolucion = detalleSolucion;
    }

    public String getEstadoCaso() {
        return estadoCaso;
    }

    public void setEstadoCaso(String estadoCaso) {
        this.estadoCaso = estadoCaso;
    }

    public String getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    public Usuarios getFkUsuario() {
        return fkUsuario;
    }

    public void setFkUsuario(Usuarios fkUsuario) {
        this.fkUsuario = fkUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCaso != null ? idCaso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Casos)) {
            return false;
        }
        Casos other = (Casos) object;
        if ((this.idCaso == null && other.idCaso != null) || (this.idCaso != null && !this.idCaso.equals(other.idCaso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidad.Casos[ idCaso=" + idCaso + " ]";
    }
    
}
