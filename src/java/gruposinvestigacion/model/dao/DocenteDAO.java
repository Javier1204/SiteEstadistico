package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.GeneralDocente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DocenteDAO extends Dao {

    private PreparedStatement state;
    private ResultSet rs;

    public DocenteDAO() {
    }

    public DocenteDAO(Connection conexion) {
        super(conexion);
    }

    public GeneralDocente get(String id) throws SQLException {

        GeneralDocente docente = null;
        String consulta = "SELECT * FROM general_docente WHERE codigo=?";
        try {
            this.abrirConexion();
            state = this.conexion.prepareStatement(consulta);
            state.setString(1, id);
            rs = state.executeQuery();
            
            while(rs.next()){
                docente = new GeneralDocente(rs.getString("codigo"), rs.getString("cedula"), rs.getString("nombres"), rs.getString("apellidos"),
                        rs.getBoolean("estado"), rs.getString("nivel_estudio"), rs.getString("categoria"), rs.getString("tipo_vinculacion"), 
                        rs.getString("correo_institucional"), rs.getString("correo_personal"), rs.getString("titulo_pregrado"), rs.getString("celular"), 
                        rs.getInt("anos_Exp"), rs.getDate("fecha_nac"), rs.getString("direccion_resi"), rs.getBoolean("oficina_habilitado"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return docente;
    }
    
    protected GeneralDocente getDocenteConexionExterna(String id) throws SQLException {

        GeneralDocente docente = null;
        String consulta = "SELECT * FROM general_docente WHERE codigo=?";
        try {
            this.abrirConexion();
            state = this.conexion.prepareStatement(consulta);
            state.setString(1, id);
            rs = state.executeQuery();
            
            while(rs.next()){
                docente = new GeneralDocente(rs.getString("codigo"), rs.getString("cedula"), rs.getString("nombres"), rs.getString("apellidos"),
                        rs.getBoolean("estado"), rs.getString("nivel_estudio"), rs.getString("categoria"), rs.getString("tipo_vinculacion"), 
                        rs.getString("correo_institucional"), rs.getString("correo_personal"), rs.getString("titulo_pregrado"), rs.getString("celular"), 
                        rs.getInt("anos_Exp"), rs.getDate("fecha_nac"), rs.getString("direccion_resi"), rs.getBoolean("oficina_habilitado"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
        }

        return docente;
    }

    public ArrayList<GeneralDocente> getGeneralDocentes() throws SQLException {

        ArrayList<GeneralDocente> docentes = new ArrayList<>();
        String consulta = "SELECT * FROM general_docente";
        try {
            this.abrirConexion();
            state = this.conexion.prepareStatement(consulta);
            rs = state.executeQuery();
            GeneralDocente docente = null;
            
            while(rs.next()){
                docente = new GeneralDocente(rs.getString("codigo"), rs.getString("cedula"), rs.getString("nombres"), rs.getString("apellidos"),
                        rs.getBoolean("estado"), rs.getString("nivel_estudio"), rs.getString("categoria"), rs.getString("tipo_vinculacion"), 
                        rs.getString("correo_institucional"), rs.getString("correo_personal"), rs.getString("titulo_pregrado"), rs.getString("celular"), 
                        rs.getInt("anos_Exp"), rs.getDate("fecha_nac"), rs.getString("direccion_resi"), rs.getBoolean("oficina_habilitado"));
                docentes.add(docente);
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return docentes;
    }
    
    public void cerrarRecursos() throws SQLException{
        if(state!=null){
            state.close();
        }
        if(rs!=null){
            rs.close();
        }
    }
}
