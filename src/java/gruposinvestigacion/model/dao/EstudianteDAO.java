package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.GeneralEstudiante;
import gruposinvestigacion.model.dto.GeneralEstudiante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class EstudianteDAO extends Dao{

    private PreparedStatement state;
    private ResultSet rs;

    public EstudianteDAO() {
    }

    public EstudianteDAO(Connection conexion) {
        super(conexion);
    }

    public GeneralEstudiante get(String id) throws SQLException {

        GeneralEstudiante estudiante = null;
        String consulta = "SELECT * FROM general_estudiante WHERE codigo=?";
        try {
            this.abrirConexion();
            state = this.conexion.prepareStatement(consulta);
            state.setString(1, id);
            rs = state.executeQuery();
            
            while(rs.next()){
                estudiante = new GeneralEstudiante(rs.getString("codigo"), rs.getString("documento_id"), 
                        rs.getString("nombres"), rs.getString("apellidos"), rs.getInt("semestre"),
                        rs.getString("programaacademico"),rs.getBoolean("activo"), rs.getBoolean("asignado_practica"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return estudiante;
    }
    
    protected GeneralEstudiante getEstudianteGeneralExterno(String id) throws SQLException {

        GeneralEstudiante estudiante = null;
        String consulta = "SELECT * FROM general_estudiante WHERE codigo=?";
        try {
            this.abrirConexion();
            state = this.conexion.prepareStatement(consulta);
            state.setString(1, id);
            rs = state.executeQuery();
            
            while(rs.next()){
                estudiante = new GeneralEstudiante(rs.getString("codigo"), rs.getString("documento_id"), 
                        rs.getString("nombres"), rs.getString("apellidos"), rs.getInt("semestre"),
                        rs.getString("programaacademico"),rs.getBoolean("activo"), rs.getBoolean("asignado_practica"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
        }

        return estudiante;
    }

    public ArrayList<GeneralEstudiante> getGeneralEstudiantes() throws SQLException {

        ArrayList<GeneralEstudiante> estudiantes = new ArrayList<>();
        String consulta = "SELECT * FROM general_estudiante";
        try {
            this.abrirConexion();
            state = this.conexion.prepareStatement(consulta);
            rs = state.executeQuery();
            GeneralEstudiante estudiante = null;
            
            while(rs.next()){
                estudiante = new GeneralEstudiante(rs.getString("codigo"), rs.getString("documento_id"), 
                        rs.getString("nombres"), rs.getString("apellidos"), rs.getInt("semestre"),
                        rs.getString("programaacademico"),rs.getBoolean("activo"), rs.getBoolean("asignado_practica"));
                estudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return estudiantes;
    }
    
    public void cerrarRecursos() throws SQLException{
        if(state!=null){
            state.close();
            state = null;
        }
        if(rs!=null){
            rs.close();
            rs = null;
        }
    }
}