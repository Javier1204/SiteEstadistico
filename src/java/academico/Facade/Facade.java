/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Facade;

import academico.Controlador.*;
import academico.DTO.EstudianteDTO;
import academico.DTO.GrupoDTO;
import academico.DTO.ProyectoDTO;
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
    
    public ArrayList<GrupoDTO> asignaturasDoc(String codig_doc) throws SQLException{
        UtilControler cont = new UtilControler();
        return cont.asignaturasDoc(codig_doc);
    }
    
    public ArrayList<EstudianteDTO> obtenerEstudiantes(int cod_grp) throws SQLException {
        UtilControler cont = new UtilControler();
        return cont.obtenerEstudiantes(cod_grp);
    }
    
    public ArrayList<ProyectoDTO> obtenerProyectos(int cod_grp) throws SQLException{
        ProyectoControler cont = new ProyectoControler();
        return cont.obtenerProyectos(cod_grp);
    }
}
