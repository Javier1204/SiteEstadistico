/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Internacionalizacion.Modelo.DTO.Convenio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class DAOConvenio {
    
    public DAOConvenio(){
        
    }
    
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
            stm = con.prepareStatement("insert into general_convenio (id, nombre, descripcion,fechacreacion,fechaterminacion, vigencia,estado,tipo_convenio, id_entidad, urlimagen) values('"+c.getId()+"','"
                    +c.getNombre()+"','"+c.getDescripcion()+"','"+c.getFechacreacion()+"','"+c.getFechaterminacion()+"','"+c.getFecharadicacion()+"','"+c.getVigencia()+"','"+c.getEstado()+"','"+c.getTipoconvenio()+"','"+c.getEntidad()+"',null)");//genero el sql. 
            System.out.println(c.getNombre());
            int can = stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement
            
            if(can == 1){
                System.out.println(" registrar");
                return "Se registro convenio";
            }else{
                 System.out.println("no registrar");
                return "No se registro convenio";
            }
            
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no  registro convenio");
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
    
    
    public ArrayList<Convenio> consultarConvenios() {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Convenio> convenios = new ArrayList();
        
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
            stm = con.prepareStatement("Select * from general_convenio");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            Convenio c;
            while(resultado.next()){
                
                int id = resultado.getInt(1);
                String nombre = resultado.getString(2);
                String descripcion = resultado.getString(3);
                String creacion = resultado.getString(4);
                String terminacion = resultado.getString(5);
                String fecharadicacion = resultado.getString(6);
                String vigencia = resultado.getString(7);
                String estado = resultado.getString(8);
                String tipo_convenio = resultado.getString(9);
                int entidad = resultado.getInt(10);
                String urlimagen = resultado.getString(11);
                c = new Convenio(id,nombre,descripcion,creacion,terminacion,fecharadicacion,vigencia,estado,tipo_convenio,entidad);
                c.setId(id);
                
                convenios.add(c);
            }
            
            
            
            stm.close();//cierro el preparedstatement
            
            
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
        return convenios;
    }
    
    public Convenio consultarConvenio(String nombreconvenio) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        Convenio c = null;
        
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
            stm = con.prepareStatement("Select * from `general_convenio` where nombre=?");//genero el sql. 
            stm.setString(1, nombreconvenio);
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            while(resultado.next()){
                c = new Convenio();
                int id = resultado.getInt(1);
                String nombre = resultado.getString(2);
                String descripcion = resultado.getString(3);
                String creacion = resultado.getString(4);
                String terminacion = resultado.getString(5);
                String fecharadicacion = resultado.getString(6);
                String vigencia = resultado.getString(7);
                String estado = resultado.getString(8);
                String tipo_convenio = resultado.getString(9);
                int entidad = resultado.getInt(10);
                String urlimagen = resultado.getString(11);
                
                c.setId(id);
                c.setNombre(nombre);
                c.setDescripcion(descripcion);
                c.setFechacreacion(creacion);
                c.setFechaterminacion(terminacion);
                c.setFecharadicacion(fecharadicacion);
                c.setVigencia(vigencia);
                c.setEstado(estado);
                c.setTipoconvenio(tipo_convenio);
                c.setEntidad(entidad);
                c.setUrlimagen(urlimagen);
                
                
            }
            
            
            
            stm.close();//cierro el preparedstatement
            
            
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
        return c;
    }           
}
