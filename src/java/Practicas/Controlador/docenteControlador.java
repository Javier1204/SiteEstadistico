/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;

import Practicas.DAO.docenteDAO;
import Practicas.DTO.docenteDTO;

/**
 *
 * @author Usuario
 */
public class docenteControlador {
    
    public docenteDTO buscar_Docente(int cod){
        docenteDAO dao= new docenteDAO();
        return dao.buscar_Docente(cod);

    }
    
    
}
