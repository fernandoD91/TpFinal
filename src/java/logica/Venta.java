/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author DanielFernandoPosta
 */
@Entity
public class Venta implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int numVenta;
    @Basic
    private String medioPago;
    @Temporal(TemporalType.DATE)
    private Date fechaVenta;

    @ManyToOne
    private Cliente cliente;
    @ManyToOne
    private Empleado empleado;
    @ManyToOne
    private Paquete paqueteTuristico;
    @ManyToOne
    private ServicioTuristico servicioTurisico;

    public Venta() {
    }

    public Venta(int num_venta, String medio_pago, Date fecha_venta, Cliente cliente, Empleado empleado, Paquete paqueteTuristico, ServicioTuristico servicioTurisico) {
        this.numVenta = num_venta;
        this.medioPago = medio_pago;
        this.fechaVenta = fecha_venta;
        this.cliente = cliente;
        this.empleado = empleado;
        this.paqueteTuristico = paqueteTuristico;
        this.servicioTurisico = servicioTurisico;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Paquete getPaqueteTuristico() {
        return paqueteTuristico;
    }

    public void setPaqueteTuristico(Paquete paqueteTuristico) {
        this.paqueteTuristico = paqueteTuristico;
    }

    public ServicioTuristico getServicioTurisico() {
        return servicioTurisico;
    }

    public void setServicioTurisico(ServicioTuristico servicioTurisico) {
        this.servicioTurisico = servicioTurisico;
    }

    public int getNumVenta() {
        return numVenta;
    }

    public void setNumVenta(int numVenta) {
        this.numVenta = numVenta;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public String getMedioPago() {
        return medioPago;
    }

    public void setMedioPago(String medioPago) {
        this.medioPago = medioPago;
    }

}
