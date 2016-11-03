/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Controlador;

import internacionalizacion.Modelo.DAO.DAOConvenio;
import internacionalizacion.Modelo.DAO.DAOEntidad;
import internacionalizacion.Modelo.DTO.Entidad;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class ControladorEntidad {
    
    public String registrarEntidad(String nombre, String representante, String sector, String ambito, String tipo, String telefono, int pais, String nit) {

        DAOEntidad ent = new DAOEntidad();
        Entidad e = new Entidad(nombre, representante, sector, ambito, tipo, telefono, pais, nit);
        return ent.registrarEntidad(e);

    }
    
    
}
