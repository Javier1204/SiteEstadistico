/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Interface;

import academico.DTO.ProyectoDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mauricio
 */
public interface IProyectoDAO {
    
    public ArrayList<ProyectoDTO> obtenerProyectos(int cod_grupo) throws SQLException;
    public ArrayList<ProyectoDTO> obtenerPKeywords(int cod_grupo, String keywords) throws SQLException;
    public boolean modificarProyecto(int proyecto_id, ProyectoDTO new_dto) throws SQLException;
    public int estadoProyecto(int proyecto_id) throws SQLException;
    public String obtenerTipoEntregable(int proyecto_id) throws SQLException;
}
