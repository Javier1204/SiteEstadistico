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
public interface IProyectoDAO {
    
    public ArrayList<ProyectoDTO> obtenerProyectos(int cod_grupo) throws SQLException;
}
