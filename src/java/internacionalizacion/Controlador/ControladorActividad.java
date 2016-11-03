/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Controlador;

import internacionalizacion.Modelo.DAO.DAOActividad;
import internacionalizacion.Modelo.DTO.Actividad;

/**
 *
 * @author JAVIER
 */
public class ControladorActividad {
 
    public boolean RegistrarActividad(Actividad a){
        DAOActividad dao = new DAOActividad();
        return dao.RegistrarActividad(a);
    }
    
}
