/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;

import Practicas.DAO.estudianteDAO;
import Practicas.DTO.estudianteDTO;

/**
 *
 * @author Administrador
 */
public class estudianteControlador {
 
    public estudianteDTO buscarEstudiante(int cod){
        estudianteDAO dao= new estudianteDAO();
        return dao.buscarEstudiante(cod);
    }
}
