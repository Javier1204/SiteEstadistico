/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Controlador;

import Internacionalizacion.Modelo.DAO.DAOPais;
import Internacionalizacion.Modelo.DTO.Pais;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class ControladorPais {
    
    public ArrayList<Pais> obtenerPaises(){
        
        DAOPais dao = new DAOPais();
        return dao.consultarPaises();
    }
    
}
