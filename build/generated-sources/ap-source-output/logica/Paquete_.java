package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.ServicioTuristico;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-18T15:31:28")
@StaticMetamodel(Paquete.class)
public class Paquete_ { 

    public static volatile SingularAttribute<Paquete, Double> costo_paquete;
    public static volatile ListAttribute<Paquete, ServicioTuristico> listaServicioTuristico;
    public static volatile SingularAttribute<Paquete, Integer> codigo_paquete;

}