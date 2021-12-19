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
import javax.persistence.OneToOne;

/**
 *
 * @author DanielFernandoPosta
 */
@Entity
public class Empleado extends Persona implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int idEmpleado;
    @Basic
    private double sueldo;
    private String cargo;
    @OneToOne
    private Usuario usuario;

    public Empleado() {
    }

    public Empleado(int id_empleado, double sueldo, String cargo, Usuario usuario, String nombre, String apellido, String dirección, String dni, Date fecha_nac, String nacionalidad, String celular, String email) {
        super(nombre, apellido, dirección, dni, fecha_nac, nacionalidad, celular, email);
        this.idEmpleado = id_empleado;
        this.sueldo = sueldo;
        this.cargo = cargo;
        this.usuario = usuario;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

}
