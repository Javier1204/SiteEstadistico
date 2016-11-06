/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Controlador;

import academico.DAO.EquipoDAO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public class EquipoControler {
    
    public int[] registrarEquipos(ArrayList<String> equipos) throws SQLException{
        EquipoDAO dao = new EquipoDAO();
        return dao.registrarEquipo(equipos);
    }
}
