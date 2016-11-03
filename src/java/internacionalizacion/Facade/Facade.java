/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Facade;

import internacionalizacion.Controlador.ControladorActividad;
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
    
    
    
    //Metodos para el manejo de los convenios.
    
}
