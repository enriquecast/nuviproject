/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidad;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Diego Leguizamon
 */
@Entity
@Table(name = "visita")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Visita.findAll", query = "SELECT v FROM Visita v")
    , @NamedQuery(name = "Visita.findByIdVisita", query = "SELECT v FROM Visita v WHERE v.idVisita = :idVisita")
    , @NamedQuery(name = "Visita.findByVisitaNumero", query = "SELECT v FROM Visita v WHERE v.visitaNumero = :visitaNumero")
    , @NamedQuery(name = "Visita.findByFecha", query = "SELECT v FROM Visita v WHERE v.fecha = :fecha")
    , @NamedQuery(name = "Visita.findByItemUno", query = "SELECT v FROM Visita v WHERE v.itemUno = :itemUno")
    , @NamedQuery(name = "Visita.findByDetalleUno", query = "SELECT v FROM Visita v WHERE v.detalleUno = :detalleUno")
    , @NamedQuery(name = "Visita.findByItemDos", query = "SELECT v FROM Visita v WHERE v.itemDos = :itemDos")
    , @NamedQuery(name = "Visita.findByDetalleDos", query = "SELECT v FROM Visita v WHERE v.detalleDos = :detalleDos")
    , @NamedQuery(name = "Visita.findByItemTres", query = "SELECT v FROM Visita v WHERE v.itemTres = :itemTres")
    , @NamedQuery(name = "Visita.findByDetalleTres", query = "SELECT v FROM Visita v WHERE v.detalleTres = :detalleTres")
    , @NamedQuery(name = "Visita.findByItemCuatro", query = "SELECT v FROM Visita v WHERE v.itemCuatro = :itemCuatro")
    , @NamedQuery(name = "Visita.findByDetalleCuatro", query = "SELECT v FROM Visita v WHERE v.detalleCuatro = :detalleCuatro")
    , @NamedQuery(name = "Visita.findByPersona", query = "SELECT v FROM Visita v WHERE v.persona = :persona")})
public class Visita implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_Visita")
    private Integer idVisita;
    @Column(name = "visita_Numero")
    private Integer visitaNumero;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 45)
    @Column(name = "item_Uno")
    private String itemUno;
    @Size(max = 45)
    @Column(name = "detalle_Uno")
    private String detalleUno;
    @Size(max = 45)
    @Column(name = "item_Dos")
    private String itemDos;
    @Size(max = 45)
    @Column(name = "detalle_Dos")
    private String detalleDos;
    @Size(max = 45)
    @Column(name = "item_Tres")
    private String itemTres;
    @Size(max = 45)
    @Column(name = "detalle_Tres")
    private String detalleTres;
    @Size(max = 45)
    @Column(name = "item_Cuatro")
    private String itemCuatro;
    @Size(max = 45)
    @Column(name = "detalle_Cuatro")
    private String detalleCuatro;
    @Size(max = 50)
    @Column(name = "persona")
    private String persona;
    @OneToMany(mappedBy = "fkVisita")
    private List<Seguimiento> seguimientoList;

    public Visita() {
    }

    public Visita(Integer idVisita) {
        this.idVisita = idVisita;
    }

    public Integer getIdVisita() {
        return idVisita;
    }

    public void setIdVisita(Integer idVisita) {
        this.idVisita = idVisita;
    }

    public Integer getVisitaNumero() {
        return visitaNumero;
    }

    public void setVisitaNumero(Integer visitaNumero) {
        this.visitaNumero = visitaNumero;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getItemUno() {
        return itemUno;
    }

    public void setItemUno(String itemUno) {
        this.itemUno = itemUno;
    }

    public String getDetalleUno() {
        return detalleUno;
    }

    public void setDetalleUno(String detalleUno) {
        this.detalleUno = detalleUno;
    }

    public String getItemDos() {
        return itemDos;
    }

    public void setItemDos(String itemDos) {
        this.itemDos = itemDos;
    }

    public String getDetalleDos() {
        return detalleDos;
    }

    public void setDetalleDos(String detalleDos) {
        this.detalleDos = detalleDos;
    }

    public String getItemTres() {
        return itemTres;
    }

    public void setItemTres(String itemTres) {
        this.itemTres = itemTres;
    }

    public String getDetalleTres() {
        return detalleTres;
    }

    public void setDetalleTres(String detalleTres) {
        this.detalleTres = detalleTres;
    }

    public String getItemCuatro() {
        return itemCuatro;
    }

    public void setItemCuatro(String itemCuatro) {
        this.itemCuatro = itemCuatro;
    }

    public String getDetalleCuatro() {
        return detalleCuatro;
    }

    public void setDetalleCuatro(String detalleCuatro) {
        this.detalleCuatro = detalleCuatro;
    }

    public String getPersona() {
        return persona;
    }

    public void setPersona(String persona) {
        this.persona = persona;
    }

    @XmlTransient
    public List<Seguimiento> getSeguimientoList() {
        return seguimientoList;
    }

    public void setSeguimientoList(List<Seguimiento> seguimientoList) {
        this.seguimientoList = seguimientoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idVisita != null ? idVisita.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Visita)) {
            return false;
        }
        Visita other = (Visita) object;
        if ((this.idVisita == null && other.idVisita != null) || (this.idVisita != null && !this.idVisita.equals(other.idVisita))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidad.Visita[ idVisita=" + idVisita + " ]";
    }
    
}
