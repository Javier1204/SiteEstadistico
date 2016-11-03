/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import internacionalizacion.Modelo.DTO.Convenio;
import internacionalizacion.Modelo.DTO.Entidad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author JAVIER
 */
public class DAOConvenio {
    public String registrarConvenio(Convenio c) {
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
            stm = con.prepareStatement("insert into general_convenio (id,nombre, descripcion,fechacreacion,fechaterminacion, vigencia,estado,tipo_convenio, id_entidad, urlimagen) values(null,'"
                    + ""+c.getNombre()+"','"+c.getDescripcion()+"','"+c.getFechacreacion()+"','"+c.getFechaterminacion()+"','"+c.getVigencia()+"','"+c.getEstado()+"','"+c.getTipoconvenio()+"','"+c.getEntidad()+"',null)");//genero el sql. 
            System.out.println(c.getNombre());
            int can = stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement
            
            if(can == 1){
                System.out.println(" registrar");
                return "Se registro convenio";
            }else{
                 System.out.println("no registrar");
                return "No se registro entidad";
            }
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no  registrar");
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
