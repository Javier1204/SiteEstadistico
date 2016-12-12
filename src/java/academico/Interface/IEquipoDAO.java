/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Interface;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public interface IEquipoDAO {
    
    public int[] registrarEquipo(ArrayList<String> names, String[] equipos, int cod_grupo, int ent) throws SQLException;
    public int[] registrarEquipoModificable(ArrayList<String> names, String[][] data, int number, int cod_grupo, int ent) throws SQLException;
    public boolean asignarEstudianteAEquipo(String[][] data) throws SQLException;
}
