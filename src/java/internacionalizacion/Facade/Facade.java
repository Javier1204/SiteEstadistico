/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Facade;

import internacionalizacion.Controlador.*;

import internacionalizacion.Modelo.DTO.Actividad;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class Facade {
    
    
    //Metodos para el manejo de las actividades.
    public boolean RegistrarActividad(Actividad a){
        ControladorActividad c = new ControladorActividad();
        return c.RegistrarActividad(a);
    }
     public String registrarEntidad(String nombre,String representante,String sector,String ambito,String tipo,String telefono,int pais,String nit) throws Exception{
         ControladorEntidad s=new ControladorEntidad();
         return s.registrarEntidad(nombre,representante,sector,ambito,tipo,telefono,pais,nit);
       
        
    }
     public String registrarConvenio(String nombre,String descripcion,String vigencia,String tipo,String estado,String fechacreacion,String fechaterminacion,int entidad, ArrayList<String> actividades) throws Exception{
         ControladorConvenio s=new ControladorConvenio();
         return s.registrarEntidad(nombre, descripcion,vigencia,tipo,estado,fechacreacion,fechaterminacion, entidad, actividades);
       
        
    }
    
    
    
    //Metodos para el manejo de los convenios.
    
}
