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
@Table(name = "bebida")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bebida.findAll", query = "SELECT b FROM Bebida b"),
    @NamedQuery(name = "Bebida.findById", query = "SELECT b FROM Bebida b WHERE b.id = :id"),
    @NamedQuery(name = "Bebida.findByNombreBebida", query = "SELECT b FROM Bebida b WHERE b.nombreBebida = :nombreBebida"),
    @NamedQuery(name = "Bebida.findByPrecioBebida", query = "SELECT b FROM Bebida b WHERE b.precioBebida = :precioBebida")})
public class Bebida implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "nombreBebida")
    private String nombreBebida;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precioBebida")
    private int precioBebida;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bebida")
    private List<Pedido> pedidoList;

    public Bebida() {
    }

    public Bebida(Integer id) {
        this.id = id;
    }

    public Bebida(Integer id, String nombreBebida, int precioBebida) {
        this.id = id;
        this.nombreBebida = nombreBebida;
        this.precioBebida = precioBebida;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombreBebida() {
        return nombreBebida;
    }

    public void setNombreBebida(String nombreBebida) {
        this.nombreBebida = nombreBebida;
    }

    public int getPrecioBebida() {
        return precioBebida;
    }

    public void setPrecioBebida(int precioBebida) {
        this.precioBebida = precioBebida;
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
        if (!(object instanceof Bebida)) {
            return false;
        }
        Bebida other = (Bebida) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "db.Bebida[ id=" + id + " ]";
    }
    
}
