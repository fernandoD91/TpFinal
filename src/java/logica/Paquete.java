/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

/**
 *
 * @author DanielFernandoPosta
 */
@Entity
public class Paquete implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int codigoPaquete;
    @Basic
    private double costoPaquete;
    @ManyToMany
    List<ServicioTuristico> listaServicioTuristico;

    public Paquete() {
    }

    public Paquete(int codigo_paquete, double costo_paquete, List<ServicioTuristico> listaServicioTuristico) {
        this.codigoPaquete = codigo_paquete;
        this.costoPaquete = costo_paquete;
        this.listaServicioTuristico = listaServicioTuristico;
    }

    public int getCodigoPaquete() {
        return codigoPaquete;
    }

    public void setCodigoPaquete(int codigoPaquete) {
        this.codigoPaquete = codigoPaquete;
    }

    public double getCostoPaquete() {
        return costoPaquete;
    }

    public void setCostoPaquete(double costoPaquete) {
        this.costoPaquete = costoPaquete;
    }

    public List<ServicioTuristico> getListaServicioTuristico() {
        return listaServicioTuristico;
    }

    public void setListaServicioTuristico(List<ServicioTuristico> listaServicioTuristico) {
        this.listaServicioTuristico = listaServicioTuristico;
    }

}
