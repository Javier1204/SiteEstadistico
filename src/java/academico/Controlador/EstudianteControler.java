/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Controlador;

import academico.DAO.EstudianteDAO;
import academico.DTO.ProyectoDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public class EstudianteControler {

    public ArrayList<ProyectoDTO> listarProyectos(String cod_estudiante) throws SQLException {
        EstudianteDAO dao = new EstudianteDAO();
        return dao.listarProyectos(cod_estudiante);
    }
    
    public int obtenerCodigoEquipo(String cod_estudiante, int proyecto) throws SQLException {
        EstudianteDAO dao = new EstudianteDAO();
        return dao.obtenerCodigoEquipo(cod_estudiante, proyecto);
    }
    
    public boolean subirEntregable(int cod_equipo, int cod_entregable, String url) throws SQLException {
        EstudianteDAO dao = new EstudianteDAO();
        return dao.subirEntregable(cod_equipo, cod_entregable, url);
    }
}
