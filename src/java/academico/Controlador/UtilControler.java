/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Controlador;

import academico.DAO.UtilDAO;
import academico.DTO.EstudianteDTO;
import academico.DTO.GrupoDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public class UtilControler {
    public ArrayList<GrupoDTO> asignaturasDoc(String codig_doc) throws SQLException{
        UtilDAO dao = new UtilDAO();
        return dao.asignaturasDoc(codig_doc);
    }
    
    public ArrayList<EstudianteDTO> obtenerEstudiantes(int cod_grp) throws SQLException {
        UtilDAO dao = new UtilDAO();
        return dao.obtenerEstudiantes(cod_grp);
    }
}
