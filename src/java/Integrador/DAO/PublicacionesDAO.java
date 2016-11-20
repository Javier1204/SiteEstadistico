/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Integrador.DAO;

import Integrador.DTO.PublicacionDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author carlos
 */
public class PublicacionesDAO {

    /**
     * genera una publicacion y la pone en el tablero para visualizarla
     *
     * @param dto
     * @return
     */
    public boolean crearPublicaciones(PublicacionDTO dto) {
        Pool pool = Conexion.getPool();
        Connection con = null;
        boolean exito1 = false;
        boolean exito2 = false;
        boolean exito = false;
        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion

            if (dto.getNombreModulo().equals("") && dto.getNombreInforme().equals("")) {
                exito1 = crearPublicacion(dto, con);
                exito2 = insertarEnTablero(dto, con);
            }
            if (exito1 && exito2) {
                exito = true;
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

        stm = con.prepareStatement("insert into integrador_publicacion (titulo,texto) values(?,?)");//genero el sql. 
        stm.setString(1, dto.getTitulo());
        stm.setString(2, dto.getContenido());

        stm.executeUpdate();//ejecuto la consulta
        stm.close();//cierro el preparedstatement

        return true;

    }

    /**
     * coloca la publicacion generada en el tablero
     *
     * @param dto
     * @param con
     * @return
     * @throws SQLException
     */
    private boolean insertarEnTablero(PublicacionDTO dto, Connection con) throws SQLException {
        PreparedStatement stm = null;

        stm = con.prepareStatement("insert into integrador_publicacion (titulo,texto) values(?,?)");//genero el sql. 
        stm.setString(1, dto.getTitulo());
        stm.setString(2, dto.getContenido());

        stm.executeUpdate();//ejecuto la consulta
        stm.close();//cierro el preparedstatement

        return true;
    }

    /**
     * trae el ultimo id registrado en la tabla integrador_publicacion
     * @param con
     * @return
     * @throws SQLException 
     */
    public int ultimoValor(Connection con) throws SQLException {
        PreparedStatement stm = null;
        int id = 0;
        stm = con.prepareStatement("select max(id) from integrador_publicacion");//genero el sql. 

        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            id = rs.getInt(1);
        }
        stm.close();//cierro el preparedstatement
        rs.close(); //cierro el resultset
        return id;
    }

}
