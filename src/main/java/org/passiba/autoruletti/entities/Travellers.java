/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.passiba.autoruletti.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author pauline
 */
@Entity
@Table(name = "travellers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Travellers.findAll", query = "SELECT t FROM Travellers t"),
    @NamedQuery(name = "Travellers.findByTravellerId", query = "SELECT t FROM Travellers t WHERE t.travellerId = :travellerId"),
    @NamedQuery(name = "Travellers.findByFirstName", query = "SELECT t FROM Travellers t WHERE t.firstName = :firstName"),
    @NamedQuery(name = "Travellers.findByLastName", query = "SELECT t FROM Travellers t WHERE t.lastName = :lastName"),
    @NamedQuery(name = "Travellers.findByPhonenumber", query = "SELECT t FROM Travellers t WHERE t.phonenumber = :phonenumber")})
public class Travellers implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "traveller_id")
    private Long travellerId;
    @Size(max = 50)
    @Column(name = "firstName")
    private String firstName;
    @Size(max = 60)
    @Column(name = "LastName")
    private String lastName;
    @Column(name = "Phonenumber")
    private Integer phonenumber;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "travellerId", fetch = FetchType.LAZY)
    private Collection<TravellerDestination> travellerDestinationCollection;

    public Travellers() {
    }

    public Travellers(Long travellerId) {
        this.travellerId = travellerId;
    }

    public Long getTravellerId() {
        return travellerId;
    }

    public void setTravellerId(Long travellerId) {
        this.travellerId = travellerId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Integer phonenumber) {
        this.phonenumber = phonenumber;
    }

    @XmlTransient
    public Collection<TravellerDestination> getTravellerDestinationCollection() {
        return travellerDestinationCollection;
    }

    public void setTravellerDestinationCollection(Collection<TravellerDestination> travellerDestinationCollection) {
        this.travellerDestinationCollection = travellerDestinationCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (travellerId != null ? travellerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Travellers)) {
            return false;
        }
        Travellers other = (Travellers) object;
        if ((this.travellerId == null && other.travellerId != null) || (this.travellerId != null && !this.travellerId.equals(other.travellerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.passiba.autoruletti.entities.Travellers[ travellerId=" + travellerId + " ]";
    }
    
}
