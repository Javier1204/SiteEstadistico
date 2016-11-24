/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import internacionalizacion.Modelo.DTO.Actividad_Estudiante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author JAVIER
 */
public class DAOActividad_Estudiante {
    
    
    public String registrarActividad_Estudiante(Actividad_Estudiante a) {
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
            stm = con.prepareStatement("INSERT INTO `oficina_actividadconvenioxgeneral_estudiante`(`codigo estudiante`, `id actividadconvenio`) VALUES (?,?)");//genero el sql. 
            
            stm.setString(1, a.getCodigoestudiante()); 
            stm.setInt(2, a.getIdactividad()); 
            
            int can = stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement
            
            if(can == 1){
                System.out.println(" Se registro el estudiante");
                return "Se registro entidad";
            }else{
                 System.out.println("no registro el estudiante");
                return "No se registro estudiante";
            }
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no  registro estudiante");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("asdasd no registrar");
                System.err.println(ex);
            }
        }   
        return null;
    }            
}
