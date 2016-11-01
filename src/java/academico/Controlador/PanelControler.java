/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Controlador;

import academico.DAO.PanelDocenteDAO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public class PanelControler {
    
    public ArrayList<String> asignaturasDoc(int codig_doc) throws SQLException{
        PanelDocenteDAO dao = new PanelDocenteDAO();
        return dao.asignaturasDoc(codig_doc);
    }
}
