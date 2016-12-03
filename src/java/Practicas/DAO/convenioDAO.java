/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Practicas.DTO.convenioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class convenioDAO {
    
    public String registrarConvenio(convenioDTO c) {
     //ejemplo para usar el pool de conexiones. 
        System.out.println(c.toString());
        String rta= "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {
            /**
             * 02/11/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();
             
            String sql= "insert into general_convenio (id, nombre, descripcion,fecharadicacion,fechacreacion,fechaterminacion, vigencia,estado,tipo_convenio, id_entidad) values('"
                    +c.getIdconvenio()+"','"+c.getNombreConvenio()+"','"+c.getDescripcion()+"','"+c.getFecha_radicacion()+"','"+c.getFechainicio()+"','"+c.getFechafin()+"','"+c.getVigencia()+"','"+c.getEstado()+"','"+c.getTipoConvenio()+"','"+c.getIdempresa()+"')";//genero el sql. 
            System.out.println(c.getNombreConvenio());
            pst= con.prepareStatement(sql);
            
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                rta= "Se ha registrado el convenio satisfactoriamente";
                System.out.println(" registrar");
                
            }else{
                 System.out.println("No es posible registrarlo");
                rta = "No registro";
            }
         
            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }
    
    
    public ArrayList<convenioDTO> consultarConvenios() {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<convenioDTO> convenios = new ArrayList();
        
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
            stm = con.prepareStatement("SELECT * \n" +
"FROM general_convenio\n" +
"INNER JOIN oficina_entidad ON oficina_entidad.id = general_convenio.id_entidad\n" +
"INNER JOIN oficina_tipo_actividades ON oficina_tipo_actividades.idconvenio = general_convenio.Id\n" +
"WHERE practica =  '1'");//genero el sql. 
            System.out.println(stm);
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            convenioDTO c;
            while(resultado.next()){
                
                String id = resultado.getString(1);
                String nombreConvenio = resultado.getString(2);
                String descripcion = resultado.getString(3);
                String fecha_radicacion=resultado.getString(4);
                String fechainicio = resultado.getString(5);
                String fechafin = resultado.getString(6);
                String vigencia = resultado.getString(7);
                String estado = resultado.getString(8);
                String tipoConvenio=resultado.getString(9);
                int iEmpresa=resultado.getInt(10);
                
                String nombreEmpresa = resultado.getString(16);
                
                c = new convenioDTO(id, nombreConvenio, descripcion, fecha_radicacion,fechainicio, fechafin, vigencia, estado, iEmpresa,tipoConvenio);
                c.setIdconvenio(id);
                c.setEmpresa(iEmpresa, nombreEmpresa);
                
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
    
    public convenioDTO consultarConvenio(String nombreconvenio) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        convenioDTO c = null;
        
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
                c = new convenioDTO();
                String id = resultado.getString(1);
                String nombre = resultado.getString(2);
                String descripcion = resultado.getString(3);
                String fecha_radicacion=resultado.getString(4);
                String creacion = resultado.getString(5);
                String terminacion = resultado.getString(6);
                String vigencia = resultado.getString(7);
                String estado = resultado.getString(8);
                
                int entidad = resultado.getInt(10);
                
                
                c.setIdconvenio(id);
                c.setNombreConvenio(nombre);
                c.setDescripcion(descripcion);
                c.setFecha_radicacion(fecha_radicacion);
                c.setFechainicio(creacion);
                c.setFechafin(terminacion);
                c.setVigencia(vigencia);
                c.setEstado(estado);
                c.setIdempresa(entidad);
                
                
               
            }
            
             System.out.println("convenio en consulta"+c.toString());
            
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
     public String eliminarConvenio(String id) throws SQLException {
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        String rta = "No conecto";
        

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
            
            String sql = "DELETE FROM general_convenio WHERE id='"+id+"';";
            System.out.println("esta es la consulta"+sql);
            pst = con.prepareStatement(sql);

            int a = pst.executeUpdate();
            con.close();
            
              
            

            if (a == 1) {
                System.out.println(" registrar");
                rta = "Se ha actualizado la empresa";
            } else {
                System.out.println("no registrar");
                rta = "No es posible actualizarla";
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.close();
        }
        return rta;
    }

    public String editarConvenio(convenioDTO p) throws SQLException {
        
        String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;

        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();
            
            String sql = "update  general_convenio SET id='"+p.getIdconvenio()+"',nombre='"+p.getNombreConvenio()+ "',descripcion='" + p.getDescripcion()+ "',fecharadicacion='" + p.getFecha_radicacion()+"',fechacreacion='"+p.getFechainicio()+"',fechaterminacion='" +p.getFechafin()+"',vigencia='" +p.getVigencia()+"',estado='" +p.getEstado()+"',id_entidad='" +p.getIdempresa()+"' where id='"+p.getIdconvenio()+"';";
            System.out.println(sql);
            pst = con.prepareStatement(sql);

            int a = pst.executeUpdate();
            con.close();
            
              
            

            if (a == 1) {
                System.out.println(" registrar");
                rta = "Se ha actualizado la empresa";
            } else {
                System.out.println("no registrar");
                rta = "No es posible actualizarla";
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.close();
        }
        return rta;
    }

    
    public convenioDTO buscarConvenio(String id) {
        convenioDTO dato = new convenioDTO();
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM `general_convenio` WHERE id='"+id+"';";
        System.out.println("la consulta"+sql);
        try {
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();

            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {
                dato.setIdconvenio(rs.getString("id"));
                dato.setNombreConvenio(rs.getString("nombre"));
                dato.setDescripcion(rs.getString("descripcion"));
                dato.setFecha_radicacion(rs.getString("fecharadicacion"));
                dato.setFechainicio(rs.getString("fechacreacion"));
                dato.setFechafin(rs.getString("fechaterminacion"));
                dato.setVigencia(rs.getString("vigencia"));
                dato.setEstado(rs.getString("estado"));
                dato.setIdempresa(rs.getInt("id_entidad"));
            }
            conn.close();

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("resultado consulta"+dato.toString());
        return dato;
    }
}
