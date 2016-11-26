/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Integrador.DAO;

import Integrador.DTO.InformeDTO;

import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author carlos
 */
public class InformeDAO {

    /**
     * este metodo lista todas las publicaciones registradas de mayor a menor
     * segun el año y semestre
     *
     * @return
     */
    public List<InformeDTO> listarPublicaciones() {
        ArrayList<InformeDTO> lista = new ArrayList();
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("select i.id_informe, i.nombre, i.url_informe, i.modulo, i.descripcion, i.semestre, i.ano from  integrador_informe i  order by i.ano DESC, i.semestre DESC");//genero el sql. 
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InformeDTO p = new InformeDTO();
                p.setId_informe(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setUrl_informe(rs.getString(3));
                p.setModulo(rs.getString(4));
                p.setSemestre(rs.getInt(5));
                p.setAno(rs.getInt(6));

                lista.add(p);

            }
            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            System.err.println(ex);
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex2) {
                System.err.println(ex2);
            }

        }

        return lista;
    }
    
    /**
     * este metodo lista las publicaciones ordenado de mayor a menor segun año y semestre y  segun un determinado modulo.
     * @param modulo
     * @return 
     */
     public List<InformeDTO> listarPublicacionesModulo(String modulo) {
        ArrayList<InformeDTO> lista = new ArrayList();
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("select i.id_informe, i.nombre, i.url_informe, i.modulo, i.descripcion, i.semestre, i.ano from  integrador_informe i where i.modulo = ? order by i.ano DESC, i.semestre DESC");//genero el sql. 
            stm.setString(1, modulo);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InformeDTO p = new InformeDTO();
                p.setId_informe(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setUrl_informe(rs.getString(3));
                p.setModulo(rs.getString(4));
                p.setSemestre(rs.getInt(5));
                p.setAno(rs.getInt(6));

                lista.add(p);

            }
            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            System.err.println(ex);
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex2) {
                System.err.println(ex2);
            }

        }

        return lista;
    }


}
