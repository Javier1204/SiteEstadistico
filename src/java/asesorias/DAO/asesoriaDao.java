/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asesorias.DAO;

import asesorias.DTO.Asesoria;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author DiegoLeal
 */
public class asesoriaDao {

    private static Pool pool;

    public static Pool getPool() {
        if (pool == null) {
            pool = new Pool();
        }
        return pool;
    }

    public asesoriaDao() {
    }

    public String registrarAsesoria(Asesoria asesoria) {
        String msj ="exito";
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {
            /**
             * 28/10/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            
            stm = con.prepareStatement("INSERT INTO asesoria_formatoasesoria(fecha, cod_est, cod_docente, cod_m, "
                    + "grupo, tema, hora) VALUES (CAST(? AS DATE), ?, ?, ?, ?, ?, ?)");//genero el sql. 
            stm.setString(1, asesoria.getFecha());
            stm.setString(2, asesoria.getCod_est());
            stm.setString(3, asesoria.getCod_docente());
            stm.setString(4, asesoria.getCod_m());
            stm.setString(5, asesoria.getGrupo());
            stm.setString(6, asesoria.getTema());
            stm.setString(7, asesoria.getHora());
            
            stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement

        } catch (SQLException ex) {
            msj = "error";
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
        }
        return msj;
    }
}
