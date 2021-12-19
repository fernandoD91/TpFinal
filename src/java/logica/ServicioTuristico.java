/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author DanielFernandoPosta
 *
 * La agencia de turismo ofrece diferentes tipos de servicios a sus potenciales
 * clientes: o Hotel por noche/s o Alquiler de auto o Pasajes de colectivo o
 * Pasajes de avión o Pasajes de tren o Excursiones o Entradas a Eventos
 *
 *
 * Cada servicio puede ser contratado de dos maneras posibles: o De forma
 * individual o En un paquete turístico (con otros servicios)
 *
 */
@Entity
public class ServicioTuristico implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int codigo_servicio;
    @Basic
    private String nombre;
    private String descripciónBreve;
    private String destinoServicio;
    private double costoServicio;
    @Temporal(TemporalType.DATE)
    private Date fecha_servicio;
    @ManyToMany
    List<Paquete> ListaPaquete;

    public ServicioTuristico() {

    }

    public ServicioTuristico(int codigo_servicio, String nombre, String descripción_breve, String destino_servicio, double costo_servicio, Date fecha_servicio, List<Paquete> ListaPaquete) {
        this.codigo_servicio = codigo_servicio;
        this.nombre = nombre;
        this.descripciónBreve = descripción_breve;
        this.destinoServicio = destino_servicio;
        this.costoServicio = costo_servicio;
        this.fecha_servicio = fecha_servicio;
        this.ListaPaquete = ListaPaquete;
    }

    public int getCodigo_servicio() {
        return codigo_servicio;
    }

    public void setCodigo_servicio(int codigo_servicio) {
        this.codigo_servicio = codigo_servicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripciónBreve() {
        return descripciónBreve;
    }

    public void setDescripciónBreve(String descripciónBreve) {
        this.descripciónBreve = descripciónBreve;
    }

    public String getDestinoServicio() {
        return destinoServicio;
    }

    public void setDestinoServicio(String destinoServicio) {
        this.destinoServicio = destinoServicio;
    }

    public double getCostoServicio() {
        return costoServicio;
    }

    public void setCostoServicio(double costoServicio) {
        this.costoServicio = costoServicio;
    }

    public Date getFecha_servicio() {
        return fecha_servicio;
    }

    public void setFecha_servicio(Date fecha_servicio) {
        this.fecha_servicio = fecha_servicio;
    }

    public List<Paquete> getListaPaquete() {
        return ListaPaquete;
    }

    public void setListaPaquete(List<Paquete> ListaPaquete) {
        this.ListaPaquete = ListaPaquete;
    }

}
