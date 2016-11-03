/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Controlador;

import internacionalizacion.Modelo.DAO.DAOTipo_actividades;
import internacionalizacion.Modelo.DTO.Tipo_actividades;

/**
 *
 * @author JAVIER
 */
public class ControladorTipo_actividades {
    
    public boolean registrarTipo_actividades(Tipo_actividades act){
        DAOTipo_actividades dao = new DAOTipo_actividades();
        return dao.registrarTipo_actividades(act);
    }
    
}
