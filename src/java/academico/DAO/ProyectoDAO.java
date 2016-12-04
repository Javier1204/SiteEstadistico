/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DAO;

import academico.DTO.ProyectoDTO;
import academico.Interface.IProyectoDAO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mauricio
 */
public class ProyectoDAO implements IProyectoDAO{

    @Override
    public ArrayList<ProyectoDTO> obtenerProyectos(int cod_grupo) throws SQLException {
        ArrayList<ProyectoDTO> proyectos = null;
        Pool pool = Conexion.getPool();
        Connection con = null;
        try{
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            proyectos = new ArrayList();
            PreparedStatement stmt = con.prepareStatement("SELECT academico_proyecto.id, academico_proyecto.nombre, academico_proyecto.keywords, "
                    + "academico_proyecto.desc, academico_proyecto.max_integrantes, academico_proyecto.semillero, academico_proyecto.modificable"
                    + " FROM academico_proyecto, academico_proyectoxgrupo"
                    + " WHERE academico_proyectoxgrupo.id_grupo = ?"
                    + " AND academico_proyecto.id = academico_proyectoxgrupo.id_proyecto");
            stmt.setInt(1, cod_grupo);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                ProyectoDTO dto = new ProyectoDTO();
                dto.setProyecto_id(rs.getInt(1));
                dto.setProyecto_name(rs.getString(2));
                dto.setKeywords(rs.getString(3));
                dto.setDesc(rs.getString(4));
                dto.setMax_integrantes(rs.getInt(5));
                dto.setSemillero(rs.getInt(6));
                dto.setModificable(rs.getBoolean(7));
                proyectos.add(dto);
            }
            stmt.close();
            rs.close();
        }catch(Exception ex){
            System.err.println(ex);
        }finally{
            if(con != null)
                con.close();
        }
        return proyectos;
    }

    @Override
    public boolean modificarProyecto(int proyecto_id, ProyectoDTO new_dto) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        boolean exito = false;
        try{
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("UPDATE academico_proyecto p SET p.id = ?, p.nombre = ?,"
                    + " p.keywords = ?, p.desc = ?, p.semillero = ? WHERE p.id = ?");
            stmt.setInt(1, new_dto.getProyecto_id());
            stmt.setString(2, new_dto.getProyecto_name());
            stmt.setString(3, new_dto.getKeywords());
            stmt.setString(4, new_dto.getDesc());
            stmt.setInt(5, new_dto.getSemillero());
            stmt.setInt(6, proyecto_id);
            
            int value = stmt.executeUpdate();
            if(value > 0){
                exito = true;
                stmt.close();
            }
            stmt.close();
        }catch(SQLException ex){
            System.err.println(ex);
        }finally{
            if(con != null)
                con.close();
        }
        return exito;
    }
    
}
