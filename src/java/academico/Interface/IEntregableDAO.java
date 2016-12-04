/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Interface;

import academico.DTO.ClasificacionEntregableDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public interface IEntregableDAO {
    
    public boolean crearEntregable(int id_proyecto, int id_tipo, String titulo, String fecha) throws SQLException;
    public ArrayList<ClasificacionEntregableDTO> listarClasificacion() throws SQLException;
    
}
