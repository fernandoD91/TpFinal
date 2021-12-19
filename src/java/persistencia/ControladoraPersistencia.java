/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
import logica.Empleado;
import logica.Paquete;
import logica.ServicioTuristico;
import logica.Usuario;
import logica.Venta;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author DanielFernandoPosta
 */
public class ControladoraPersistencia {

    ClienteJpaController clienteJPA = new ClienteJpaController();
    PaqueteJpaController paqueteJPA = new PaqueteJpaController();
    ServicioTuristicoJpaController servTurJPA = new ServicioTuristicoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();
    EmpleadoJpaController empJPA = new EmpleadoJpaController();

    public List<Usuario> traerUsuarios() {
        return usuJPA.findUsuarioEntities();
    }

    public void crearEmpleado(Usuario usu, Empleado emp) {
        usuJPA.create(usu);
        empJPA.create(emp);

    }

    public List<Empleado> traerEmpleados() {
        return empJPA.findEmpleadoEntities();
    }

    public void borrarEmpleado(int id) {
        try {
            empJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borraUsuario(int idUsu) {
        try {
            usuJPA.destroy(idUsu);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Empleado buscarEmpleado(int id) {
        return empJPA.findEmpleado(id);
    }

    public void modificarEmpleado(Empleado empModif) {
        try {
            empJPA.edit(empModif);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearCliente(Cliente cliente) {
        clienteJPA.create(cliente);
    }

    public List<Cliente> traerClientes() {
        return clienteJPA.findClienteEntities();
    }

    public void borrarCliente(int id) {
        try {
            clienteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Cliente buscarCliente(int id) {
        return clienteJPA.findCliente(id);
    }

    public void modificarCliente(Cliente clienteModif) {
        try {
            clienteJPA.edit(clienteModif);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearServicioTuristico(ServicioTuristico serv) {
        servTurJPA.create(serv);
    }

    public void crearVenta(Venta venta) {
        ventaJPA.create(venta);
    }

    public void crearPaquete(Paquete paquete) {
        paqueteJPA.create(paquete);
    }

    public List<ServicioTuristico> traerServiciosTuristicos() {
        return servTurJPA.findServicioTuristicoEntities();
    }

    public void borrarServicio(int id) {
        try {
            servTurJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ServicioTuristico buscarServicio(int id) {
        return servTurJPA.findServicioTuristico(id);
    }

    public Venta buscarVenta(int id) {
        return ventaJPA.findVenta(id);
    }

    public Paquete buscarPaquete(int id) {
        return paqueteJPA.findPaquete(id);
    }

    public void modificarServicio(ServicioTuristico servModif) {
        try {
            servTurJPA.edit(servModif);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarVenta(Venta venta) {
        try {
            ventaJPA.edit(venta);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Paquete> traerPaquetes() {
        return paqueteJPA.findPaqueteEntities();
    }

    public void borrarPaquete(int id) {
        try {
            paqueteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarPaquete(Paquete paquete) {
        try {
            paqueteJPA.edit(paquete);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
