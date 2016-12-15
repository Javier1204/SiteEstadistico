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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mauricio
 */
public class ProyectoDAO implements IProyectoDAO {

    @Override
    public ArrayList<ProyectoDTO> obtenerProyectos(int cod_grupo) throws SQLException {
        ArrayList<ProyectoDTO> proyectos = null;
        Pool pool = Conexion.getPool();
        Connection con = null;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            proyectos = new ArrayList();
            PreparedStatement stmt = con.prepareStatement("SELECT academico_proyecto.id, academico_proyecto.nombre, academico_proyecto.keywords, "
                    + "academico_proyecto.desc,  academico_proyecto.modificable"
                    + " FROM academico_proyecto, academico_proyectoxgrupo"
                    + " WHERE academico_proyectoxgrupo.id_grupo = ?"
                    + " AND academico_proyecto.id = academico_proyectoxgrupo.id_proyecto");
            stmt.setInt(1, cod_grupo);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProyectoDTO dto = new ProyectoDTO();
                dto.setProyecto_id(rs.getInt(1));
                dto.setProyecto_name(rs.getString(2));
                dto.setKeywords(rs.getString(3));
                dto.setDesc(rs.getString(4));
                dto.setModificable(rs.getBoolean(5));
                proyectos.add(dto);
            }
            stmt.close();
            rs.close();
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return proyectos;
    }

    @Override
    public boolean modificarProyecto(int proyecto_id, ProyectoDTO new_dto) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        boolean exito = false;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("UPDATE academico_proyecto p SET p.id = ?, p.nombre = ?,"
                    + " p.keywords = ?, p.desc = ? WHERE p.id = ?");
            stmt.setInt(1, new_dto.getProyecto_id());
            stmt.setString(2, new_dto.getProyecto_name());
            stmt.setString(3, new_dto.getKeywords());
            stmt.setString(4, new_dto.getDesc());
            stmt.setInt(51111, proyecto_id);

            int value = stmt.executeUpdate();
            if (value > 0) {
                exito = true;
                stmt.close();
            }
            stmt.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return exito;
    }

    @Override
    public ArrayList<ProyectoDTO> obtenerPKeywords(int cod_grupo, String keywords) throws SQLException {
        ArrayList<ProyectoDTO> proyectos = null;
        Pool pool = Conexion.getPool();
        Connection con = null;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            proyectos = new ArrayList();
            PreparedStatement stmt = con.prepareStatement("SELECT academico_proyecto.id, academico_proyecto.nombre, academico_proyecto.keywords, "
                    + "academico_proyecto.desc,  academico_proyecto.modificable"
                    + " FROM academico_proyecto, academico_proyectoxgrupo"
                    + " WHERE academico_proyectoxgrupo.id_grupo = ?"
                    + " AND academico_proyecto.id = academico_proyectoxgrupo.id_proyecto"
                    + " AND academico_proyecto.keywords LIKE '%" + keywords + "%'");
            stmt.setInt(1, cod_grupo);
//            PreparedStatement stmt = con.prepareStatement("SELECT * FROM academico_proyecto WHERE academico_proyecto LIKE '%" + keywords + "%'");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProyectoDTO dto = new ProyectoDTO();
                dto.setProyecto_id(rs.getInt(1));
                dto.setProyecto_name(rs.getString(2));
                dto.setKeywords(rs.getString(3));
                dto.setDesc(rs.getString(4));
                dto.setModificable(rs.getBoolean(5));
                proyectos.add(dto);
            }
            stmt.close();
            rs.close();
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return proyectos;
    }

    @Override
    public int estadoProyecto(int proyecto_id) throws SQLException {
        int estado = 0;
        //1-> correcto 2-> rip
        Pool pool = Conexion.getPool();
        Connection con = null;
        PreparedStatement stmt = null;
        String dateFinal="", dateActual = "";
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt = con.prepareStatement("SELECT academico_entregable.fecha_entrega FROM academico_entregable WHERE academico_entregable.id_proyecto = ?");
            stmt.setInt(1, proyecto_id);
            ResultSet rs1 = stmt.executeQuery();
            while (rs1.next()) {
                dateFinal = rs1.getString(1);
            }
            rs1.close();

            stmt = con.prepareStatement("SELECT academico_entregable_equipo.fecha_entrega FROM academico_entregable_equipo "
                    + "WHERE academico_entregable_equipo.proyecto_id = ?");
            stmt.setInt(1, proyecto_id);
            ResultSet rs2 = stmt.executeQuery();
            while (rs2.next()) {
                dateActual = rs2.getString(1);
            }
            
            SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
            Date fechaActual = new Date();
            
            Date fechaFinal = formateador.parse(dateFinal);
            Date fechaEntrega;
            if (!dateActual.equals("")) {
               fechaEntrega = formateador.parse(dateActual);
               return 0;
            }else if(fechaActual.before(fechaFinal)){
                return 1;
                
            }else{
                return 2;
            }
            
        } catch (SQLException ex) {
            System.err.println(ex);
        } catch (ParseException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return estado;
    }

    @Override
    public String obtenerTipoEntregable(int proyecto_id) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        PreparedStatement stmt = null;
        String data = "";
        try{
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt = con.prepareStatement("SELECT academico_proyecto.formato_archivo FROM academico_proyecto WHERE academico_proyecto.id = ?");
            stmt.setInt(1, proyecto_id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                data = rs.getString(1);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ex){
            System.err.println(ex);
        }finally{
            if(con!=null)
                con.close();
        }
        return data;
    }

}
