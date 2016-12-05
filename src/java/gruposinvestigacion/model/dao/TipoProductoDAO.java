package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.Tipoproducto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TipoProductoDAO extends Dao {

    private PreparedStatement state;
    private ResultSet rs;
    
    public TipoProductoDAO(){
    }

    public Tipoproducto get(int id) throws SQLException {

        Tipoproducto tipoproducto = null;
        String sql = "SELECT * FROM investigacion_tipoproducto WHERE codigo=?";
        
        try{
            this.abrirConexion();
            state = conexion.prepareStatement(sql);
            state.setInt(1, id);
            rs = state.executeQuery();
            
            while(rs.next()){
                tipoproducto = new Tipoproducto(rs.getInt("codigo"), rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }
        return tipoproducto;
    }

    public ArrayList<Tipoproducto> getTipoproductos() throws SQLException {

        ArrayList<Tipoproducto> tipos = null;
        String sql = "SELECT * FROM investigacion_tipoproducto";
        try{
            this.abrirConexion();
            state = conexion.prepareStatement(sql);
            rs = state.executeQuery();
            Tipoproducto tipoproducto = null;
            tipos = new ArrayList<>();
            while(rs.next()){
                tipoproducto = new Tipoproducto(rs.getInt("codigo"), rs.getString("descripcion"));
                tipos.add(tipoproducto);
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }
        return tipos;
    }

    public long registrarTipo(Tipoproducto tipo) {

        long id = 0;

        return id;
    }

    public boolean modificarTipo(Tipoproducto tipo) {

        return true;
    }

    public boolean eliminarTipo(Tipoproducto tipo) {

        return true;
    }
    
    public void cerrarRecursos() throws SQLException {
        if (state != null) {
            state.close();
            state = null;
        }
        if (rs != null) {
            rs.close();
            rs=null;
        }
    }
}
