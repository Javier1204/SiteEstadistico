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
    
    public int[] registrarEquipos(ArrayList<String> data, String[] team_names, int cod_grupo, String arc,String fecha) throws SQLException{
        EquipoDAO dao = new EquipoDAO();
        return dao.registrarEquipo(data, team_names, cod_grupo, arc, fecha);
    }
    
    public int[] registrarEquipoModificable(ArrayList<String> names, String[][] data, int number, int cod_grupo, String arc,String fecha) throws SQLException{
        EquipoDAO dao = new EquipoDAO();
        return dao.registrarEquipoModificable(names, data, number, cod_grupo, arc, fecha);
    }
    
    public boolean asignarEstudianteAEquipo(String[][] data) throws SQLException {
        EquipoDAO dao = new EquipoDAO();
        return dao.asignarEstudianteAEquipo(data);
    }
}
