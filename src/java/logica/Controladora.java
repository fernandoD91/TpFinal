/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistencia.ControladoraPersistencia;

/**
 *
 * @author DanielFernandoPosta
 */
public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public Date deStringADate(String fecha) {
        Date fechaDate = new Date();
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        try {
            fechaDate = formato.parse(fecha);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechaDate;
    }

    public boolean verificarUsuario(String usuario, String password) {
        List<Usuario> listaUsuarios = controlPersis.traerUsuarios();

        if (listaUsuarios != null) {
            for (Usuario listaUsu : listaUsuarios) {
                if (listaUsu.getUsuario().equals(usuario) && listaUsu.getContrasenia().equals(password)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void crearEmpleado(String nombre, String apellido, String direccion, String DNI, Date fecha_nac, String nacionalidad, String celular,
            String email, String cargo, Double sueldo, String nombreUsuario, String contrasenia) {

        Usuario usu = new Usuario();
        Empleado emp = new Empleado();

        //asignamos usuario
        usu.setUsuario(nombreUsuario);
        usu.setContrasenia(contrasenia);

        //asignamos valores a empleado
        emp.setNombre(nombre);
        emp.setApellido(apellido);
        emp.setDirección(direccion);
        emp.setDni(DNI);
        emp.setFecha_nac(fecha_nac);
        emp.setNacionalidad(nacionalidad);
        emp.setCelular(celular);
        emp.setEmail(email);
        emp.setCargo(cargo);
        emp.setSueldo(sueldo);

        //asignamos usuario a empleado
        emp.setUsuario(usu);

        controlPersis.crearEmpleado(usu, emp);

    }

    public List<Empleado> traerEmpleados() {
        return controlPersis.traerEmpleados();
    }

    public void borrarEmpleado(int id) {
        controlPersis.borrarEmpleado(id);
    }

    public void borrarUsuario(int idUsu) {
        controlPersis.borraUsuario(idUsu);
    }

    public Empleado buscarEmpleado(int id) {
        return controlPersis.buscarEmpleado(id);
    }

    public void modificarEmpleado(Empleado empModif) {
        controlPersis.modificarEmpleado(empModif);
    }

    public void crearCliente(String nombre, String apellido, String direccion, String DNI, Date fecha_nac, String nacionalidad, String celular, String email) {
        Cliente cliente = new Cliente();

        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDirección(direccion);
        cliente.setDni(DNI);
        cliente.setFecha_nac(fecha_nac);
        cliente.setNacionalidad(nacionalidad);
        cliente.setCelular(celular);
        cliente.setEmail(email);

        controlPersis.crearCliente(cliente);
    }

    public List<Cliente> traerClientes() {
        return controlPersis.traerClientes();
    }

    public void borrarCliente(int id) {
        controlPersis.borrarCliente(id);
    }

    public Cliente buscarCliente(int id) {
        return controlPersis.buscarCliente(id);
    }

    public void modificarCliente(Cliente clienteModif) {
        controlPersis.modificarCliente(clienteModif);
    }

    public void crearServicio(ServicioTuristico serv) {
        controlPersis.crearServicioTuristico(serv);
    }

    public void crearVenta(Venta venta) {
        controlPersis.crearVenta(venta);
    }

    public void crearPaquete(Paquete paquete) {
        controlPersis.crearPaquete(paquete);
    }

    public List<ServicioTuristico> traerServiciosTuristicos() {
        return controlPersis.traerServiciosTuristicos();
    }

    public void borrarServicio(int id) {
        controlPersis.borrarServicio(id);
    }

    public ServicioTuristico buscarServicio(int id) {
        return controlPersis.buscarServicio(id);
    }
    
    public Venta buscarVenta(int id){
        return controlPersis.buscarVenta(id);
    }
    public Paquete buscarPaquete(int id){
        return controlPersis.buscarPaquete(id);
    }

    public void modificarServicio(ServicioTuristico servModif) {
        controlPersis.modificarServicio(servModif);
    }

    public void modificarVenta(Venta venta) {
        controlPersis.modificarVenta(venta);
    }
    
    public List<Paquete> traerPaquetes(){
        return controlPersis.traerPaquetes();
    }

    public void borrarPaquete(int id) {
        controlPersis.borrarPaquete(id);
    }

    public void modificarPaquete(Paquete paquete) {
        controlPersis.modificarPaquete(paquete);
    }
}
