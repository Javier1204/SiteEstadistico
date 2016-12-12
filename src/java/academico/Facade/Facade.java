/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.Facade;

import academico.Controlador.*;
import academico.DTO.ClasificacionEntregableDTO;
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
    
    public int[] registrarEquipos(ArrayList<String> data, String[] team_names, int cod_grupo, int ent) throws SQLException{
        EquipoControler cont = new EquipoControler();
        return cont.registrarEquipos(data, team_names, cod_grupo, ent);
    }
    
    public int[] registrarEquipoModificable(ArrayList<String> names, String[][] data, int number, int cod_grupo, int ent) throws SQLException{
        EquipoControler cont = new EquipoControler();
        return cont.registrarEquipoModificable(names, data, number, cod_grupo, ent);
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
    
    public ArrayList<ProyectoDTO> listarProyectos(String cod_estudiante) throws SQLException{
        EstudianteControler cont = new EstudianteControler();
        return cont.listarProyectos(cod_estudiante);
    }
    
    public boolean modificarProyecto(int proyecto_id, ProyectoDTO new_dto) throws SQLException {
        ProyectoControler cont = new ProyectoControler();
        return cont.modificarProyecto(proyecto_id, new_dto);
    }
    
    public int obtenerCodigoEquipo(String cod_estudiante, int proyecto) throws SQLException {
        EstudianteControler cont = new EstudianteControler();
        return cont.obtenerCodigoEquipo(cod_estudiante, proyecto);
    }
    
    public boolean subirEntregable(int cod_equipo, int cod_entregable, String url) throws SQLException {
        EstudianteControler cont = new EstudianteControler();
        return cont.subirEntregable(cod_equipo, cod_entregable, url);
    }
    
    public boolean asignarEstudianteAEquipo(String[][] data) throws SQLException {
        EquipoControler cont = new EquipoControler();
        return cont.asignarEstudianteAEquipo(data);
    }
    
        
    public boolean crearEntregable(int id_proyecto, int id_tipo, String titulo, String fecha) throws SQLException{
        EntregableControler cont = new EntregableControler();
        return cont.crearEntregable(id_proyecto, id_tipo, titulo, fecha);
    }
    
    public ArrayList<ClasificacionEntregableDTO> listarClasificacion() throws SQLException{
        EntregableControler cont = new EntregableControler();
        return cont.listarClasificacion();
    }
}
