/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import internacionalizacion.Modelo.DTO.Tipo_actividades;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author JAVIER
 */
public class DAOTipo_actividades {
 
    public DAOTipo_actividades(){
        
    }
    
    public boolean registrarTipo_actividades(Tipo_actividades act) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {
            /**
             * 02/11/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("INSERT INTO `oficina_tipo_actividades`(`idconvenio`, `movilidad`, `pasantia`, `investigacion`, `extension`, `social`, `practica`) VALUES (?,?,?,?,?,?,?)");//genero el sql. 
            
            stm.setInt(2, act.getIdconvenio());
            stm.setBoolean(3, act.isMovilidad());
            stm.setBoolean(4, act.isPasantia());
            stm.setBoolean(5, act.isExtension());
            stm.setBoolean(6, act.isInvestigacion());
            stm.setBoolean(7, act.isSocial());
            stm.setBoolean(8, act.isPractica());
            int can = stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("no  registro");
             return false;
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("no registro");
                System.err.println(ex);
            }
        }   
        return true;
    }
}
