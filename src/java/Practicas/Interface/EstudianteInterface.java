/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Interface;

import Practicas.DAO.estudianteDAO;
import Practicas.DTO.estudianteDTO;
import java.util.List;

/**
 *
 * @author Administrador
 */
public interface EstudianteInterface {
    public String registrarEstudiante();
    public String actualizarEstudiante(estudianteDAO e);
    public estudianteDTO buscarEstudiante(int codigo);
    public List<estudianteDTO> listarEstudiante();
}
