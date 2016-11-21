/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;

import Practicas.DAO.estudianteDAO;
import Practicas.DAO.perfil_estudianteDAO;
import Practicas.DTO.estudianteDTO;
import Practicas.DTO.perfil_estudianteDTO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrador
 */
public class estudianteControlador {
 
    public ArrayList<estudianteDTO> obtenerEstudiantes(){
        estudianteDAO dao = new estudianteDAO();
        return dao.listarEstudiante();
    }
    
    
    
    
    public estudianteDTO buscarEstudiante(int cod){
        estudianteDAO dao= new estudianteDAO();
        return dao.buscarEstudiante(cod);

    }

    public String agregarPerfilEstudiante(int perfil, int valor, int codEstudiante) {
        perfil_estudianteDAO dao= new perfil_estudianteDAO();
        return dao.agregarPerfilEstudiante(perfil, valor, codEstudiante);
    }

    public List<perfil_estudianteDTO> listarPerfilesEstudiante(int cod) {
        perfil_estudianteDAO dao= new perfil_estudianteDAO();
        return dao.listarPerfilesEstudiante(cod);
    }
    
    
    
}
