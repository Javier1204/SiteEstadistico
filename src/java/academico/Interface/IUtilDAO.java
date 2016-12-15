/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Interface;

import academico.DTO.EstudianteDTO;
import academico.DTO.GrupoDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public interface IUtilDAO {
    
    public ArrayList<GrupoDTO> asignaturasDoc(String codig_doc) throws SQLException;
    public ArrayList<EstudianteDTO> obtenerEstudiantes (int cod_grp) throws SQLException;
    public String obtenerNombreMateria(int cod_grupo) throws SQLException;
}
