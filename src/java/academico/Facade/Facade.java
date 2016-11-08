/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Facade;

import academico.Controlador.*;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public class Facade {
    
    public int[] registrarEquipos(ArrayList<String> equipos) throws SQLException{
        EquipoControler cont = new EquipoControler();
        return cont.registrarEquipos(equipos);
    }
}
