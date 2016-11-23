/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Integrador.DAO;

import Integrador.DTO.InformeDTO;
import Integrador.DTO.PublicacionDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author carlos
 */
public class PublicacionesDAO {

    /**
     * este metodo lista todas las publicaciones registradas de mayor a menor segun la fecha
     * @return 
     */
    public ArrayList<PublicacionDTO> listarPublicaciones(){
        ArrayList<PublicacionDTO> lista=new ArrayList();
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;  
        PreparedStatement stm = null;
        try {
          
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("select p.id,p.titulo,p.texto,p.fecha,i.nombre,i.url_informe from integrador_publicacion p left join integrador_informe i on p.informe=i.id_informe order by p.fecha DESC");//genero el sql. 
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
              PublicacionDTO p=new PublicacionDTO();
             p.setId(rs.getInt(1));
             p.setTitulo(rs.getString(2));
             p.setContenido(rs.getString(3));
             p.setFecha(rs.getDate(4));
             InformeDTO i=new InformeDTO();
             i.setNombre(rs.getString(5));
             i.setUrl(rs.getString(6));
            lista.add(p);
             
            }
            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            System.err.println(ex);
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.err.println(ex);
            }
            return lista;
        }
    }
    
    /**
     * genera una publicacion y la pone en el tablero para visualizarla
     *
     * @param dto
     * @return
     */
    public boolean crearPublicaciones(PublicacionDTO dto) {
        Pool pool = Conexion.getPool();
        Connection con = null;
        

        boolean exito = false;
        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion

            if (dto.getInforme()==null) {
                exito = crearPublicacion(dto, con);
            
               
            }

        } catch (SQLException ex) {
            exito = false;
            System.err.println(ex);
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.err.println(ex);
            }
            return exito;
        }
    }

    /**
     * crea una publicacion en la tabla integrador_publicaciones
     *
     * @param dto
     * @param con
     * @return
     * @throws SQLException
     */
    private boolean crearPublicacion(PublicacionDTO dto, Connection con) throws SQLException {

        PreparedStatement stm = null;

        stm = con.prepareStatement("insert into integrador_publicacion (titulo,texto,fecha) values(?,?,NOW())");//genero el sql. 
        stm.setString(1, dto.getTitulo());
        stm.setString(2, dto.getContenido());

        stm.executeUpdate();//ejecuto la consulta
        stm.close();//cierro el preparedstatement

        return true;

    }

}
