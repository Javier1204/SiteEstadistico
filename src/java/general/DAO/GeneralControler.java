/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package general.DAO;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public class GeneralControler {
    
    public ArrayList<Integer> obtenerAsignaturas(int codig_doc) throws SQLException{
        GeneralDAO dao = new GeneralDAO();
        return dao.obtenerAsignaturas(codig_doc);
    }
}
