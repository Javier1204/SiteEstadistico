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
import java.util.Date;
import java.util.List;

/**
 *
 * @author Administrador
 */
public class estudianteControlador {
 
    public ArrayList<estudianteDTO> obtener_Estudiantes(){
        estudianteDAO dao = new estudianteDAO();
        return dao.listar_Estudiante();
    }
    
    public ArrayList<estudianteDTO> obtener_Estudiantes(int semestre, int año){
        estudianteDAO dao = new estudianteDAO();
        return dao.listar_Estudiante(semestre,año);
    }
    
    public ArrayList<estudianteDTO> obtener_Estudiantes_asignados(){
        estudianteDAO dao = new estudianteDAO();
        return dao.listar_Estudiante_asignados();
    }
    
    public estudianteDTO buscarEstudiante(String cod){
        estudianteDAO dao= new estudianteDAO();
        return dao.buscarEstudiante(cod);

    }

    public String agregarPerfilesEstudiante(perfil_estudianteDTO[] perfiles) {
        perfil_estudianteDAO dao= new perfil_estudianteDAO();
        return dao.agregarPerfilesEstudiante(perfiles);
    }

    public List<perfil_estudianteDTO> listarPerfilesEstudiante(int cod) {
        perfil_estudianteDAO dao= new perfil_estudianteDAO();
        return dao.listarPerfilesEstudiante(cod);
    }
    
    public boolean guardarDocumentos(String nombre, String ruta){
        estudianteDAO dao= new estudianteDAO();
        return dao.guardarDocumentos(nombre, ruta);
    }

    public void registrarEstudiante(String codigo, String direccion, String email, String telefono) {
        estudianteDAO dao= new estudianteDAO();
        dao.registrarEstudiante(codigo, direccion, email, telefono);
    }
    
}
