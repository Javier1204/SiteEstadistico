/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Interface;

import academico.DTO.ProyectoDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public interface IEstudianteDAO {
    
    public ArrayList<ProyectoDTO> listarProyectos(String cod_estudiante) throws SQLException;
    public int obtenerCodigoEquipo(String cod_estudiante, int proyecto) throws SQLException;
    public boolean subirEntregable(int cod_Proyecto, String url) throws SQLException;
}
