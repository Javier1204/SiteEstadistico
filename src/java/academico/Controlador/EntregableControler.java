/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Controlador;

import academico.DAO.EntregableDAO;
import academico.DTO.ClasificacionEntregableDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public class EntregableControler {
    
    public boolean crearEntregable(int id_proyecto, int id_tipo, String titulo, String fecha) throws SQLException{
        EntregableDAO dao = new EntregableDAO();
        return dao.crearEntregable(id_proyecto, id_tipo, titulo, fecha);
    }
    
    public ArrayList<ClasificacionEntregableDTO> listarClasificacion() throws SQLException{
        EntregableDAO dao = new EntregableDAO();
        return dao.listarClasificacion();
    }
}
