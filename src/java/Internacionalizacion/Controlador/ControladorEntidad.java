/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Controlador;

import Internacionalizacion.Modelo.DAO.DAOEntidad;
import Internacionalizacion.Modelo.DTO.Entidad;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class ControladorEntidad {
    
    public String registrarEntidad(String nombre, String representante, String sector, String tipo, String telefono,String direccion, int pais, String nit) {

        DAOEntidad ent = new DAOEntidad();
        Entidad e = new Entidad(nombre, representante, sector, tipo, telefono, direccion, pais, nit);
        return ent.registrarEntidad(e);

    }
    
    public ArrayList<Entidad> consultarEntidades(){
        
        DAOEntidad dao = new DAOEntidad();
        return dao.consultarEntidades();
    }
    
    
}
