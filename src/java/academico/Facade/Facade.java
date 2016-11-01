/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Facade;

import general.DAO.GeneralControler;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public class Facade {
    
    public ArrayList<Integer> obtenerAsignaturas(int codig_doc) throws SQLException{
        GeneralControler cont = new GeneralControler();
        return cont.obtenerAsignaturas(codig_doc);
    }
}
