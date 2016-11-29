/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author lucas
 */
@Entity
@Table(name = "plato")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Plato.findAll", query = "SELECT p FROM Plato p"),
    @NamedQuery(name = "Plato.findById", query = "SELECT p FROM Plato p WHERE p.id = :id"),
    @NamedQuery(name = "Plato.findByNombrePlato", query = "SELECT p FROM Plato p WHERE p.nombrePlato = :nombrePlato"),
    @NamedQuery(name = "Plato.findByPrecioPlato", query = "SELECT p FROM Plato p WHERE p.precioPlato = :precioPlato")})
public class Plato implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "nombrePlato")
    private String nombrePlato;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precioPlato")
    private int precioPlato;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "plato")
    private List<Pedido> pedidoList;

    public Plato() {
    }

    public Plato(Integer id) {
        this.id = id;
    }

    public Plato(Integer id, String nombrePlato, int precioPlato) {
        this.id = id;
        this.nombrePlato = nombrePlato;
        this.precioPlato = precioPlato;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombrePlato() {
        return nombrePlato;
    }

    public void setNombrePlato(String nombrePlato) {
        this.nombrePlato = nombrePlato;
    }

    public int getPrecioPlato() {
        return precioPlato;
    }

    public void setPrecioPlato(int precioPlato) {
        this.precioPlato = precioPlato;
    }

    @XmlTransient
    public List<Pedido> getPedidoList() {
        return pedidoList;
    }

    public void setPedidoList(List<Pedido> pedidoList) {
        this.pedidoList = pedidoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Plato)) {
            return false;
        }
        Plato other = (Plato) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.Plato[ id=" + id + " ]";
    }
    
}
