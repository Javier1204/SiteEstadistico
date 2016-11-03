/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Facade;

import internacionalizacion.Controlador.ControladorActividad;
import internacionalizacion.Controlador.ControladorEntidad;
import internacionalizacion.Modelo.DTO.Actividad;

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
    
    
    
    //Metodos para el manejo de los convenios.
    
}
