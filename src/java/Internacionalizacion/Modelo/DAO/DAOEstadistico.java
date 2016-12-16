/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import Internacionalizacion.Modelo.DTO.Estadistico;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class DAOEstadistico {
    
    //Consulta para obtener la cantidad de convenios registrados.
    public int consultarCantidadConvenios(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        int cantidad = 0;
        
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
            System.out.println("########################");
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT count(*) FROM `general_convenio`");//genero el sql.
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT count(*) FROM `general_convenio` where fechacreacion>=? and fechaterminacion<=?");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            System.out.println("-------------------------------");
            
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            
            while(resultado.next()){
                
                cantidad = resultado.getInt(1);               
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return cantidad;
    }           
    
    //Consultar cantidad de convenios activos.
    public int consultarCantidadConveniosActivos(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        int cantidad = 0;
        
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
           
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT count(*) FROM general_convenio WHERE CURDATE() <= fechaterminacion");//genero el sql.
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT count(*) FROM general_convenio WHERE CURDATE() <= fechaterminacion AND fechacreacion>=? and fechaterminacion<=?");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            while(resultado.next()){
                
                cantidad = resultado.getInt(1);               
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return cantidad;
    }           
    
    //Consulta para obtener la cantidad de convenios aprobados y terminados.
    public ArrayList<Estadistico> consultarConveniosporEstado(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT estado, count(*) FROM `general_convenio` GROUP BY estado");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT estado, count(*) FROM `general_convenio` WHERE fechacreacion>=? and fechaterminacion<=? GROUP BY estado");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            
            while(resultado.next()){
                
                String estado = resultado.getString(1);
                int cantidad = resultado.getInt(2);
                
                Estadistico e = new Estadistico(estado, cantidad);
                //String fila = ""+estado+";"+cantidad;
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
    //Consulta para obtener la cantidad de convenios por tipo.
    public ArrayList<Estadistico> consultarConveniosporTipo(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT tipo_convenio, count(*) FROM `general_convenio` GROUP BY tipo_convenio");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT tipo_convenio, count(*) FROM `general_convenio` WHERE fechacreacion>=? and fechaterminacion<=?  GROUP BY tipo_convenio");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            
            while(resultado.next()){
                
                String tipo = resultado.getString(1);
                int cantidad = resultado.getInt(2);
                
                Estadistico e = new Estadistico(tipo, cantidad);
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
    //Consulta para obtener la cantidad de convenios radicados por años.
    public ArrayList<Estadistico> consultarConveniosporRadicadosPorAños(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT YEAR(fecharadicacion), count(*) FROM general_convenio GROUP BY YEAR(fecharadicacion)");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT YEAR(fecharadicacion), count(*) FROM general_convenio WHERE fechacreacion>=? and fechaterminacion<=? GROUP BY YEAR(fecharadicacion)");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
          
            while(resultado.next()){
                
                String año = resultado.getString(1);
                int cantidad = resultado.getInt(2);
                
                Estadistico e = new Estadistico(año, cantidad);
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
    //Consulta para obtener la cantidad de actividades por tipos.
    public ArrayList<Estadistico> consultarActividadesporTipos(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT tipoactividad, count(*) FROM `oficina_actividadconvenio` GROUP BY tipoactividad");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT a.tipoactividad, count(*) FROM `oficina_actividadconvenio` a, `general_convenio` c WHERE c.id=a.id_convenio AND c.fechacreacion>=? AND c.fechaterminacion<=? GROUP BY a.tipoactividad");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
          
            while(resultado.next()){
                
                String tipo = resultado.getString(1);
                int cantidad = resultado.getInt(2);
                
                Estadistico e = new Estadistico(tipo, cantidad);
                System.out.println("Adicionando actividad por tipo");
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }


    //Consulta para obtener la cantidad de actividades por convenios.
    public ArrayList<Estadistico> consultarActividadesporConvenios(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT c.id, COUNT(*) FROM general_convenio c, oficina_actividadconvenio a WHERE a.id_convenio = c.id GROUP BY a.id_convenio");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT c.id, COUNT(*) FROM general_convenio c, oficina_actividadconvenio a WHERE a.id_convenio = c.id  AND c.fechacreacion>=? AND c.fechaterminacion<=? GROUP BY a.id_convenio");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
          
            while(resultado.next()){
                
                String convenio = resultado.getString(1);
                int cantidad = resultado.getInt(2);
                
                Estadistico e = new Estadistico(convenio, cantidad);
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }
    
    //Consulta para obtener la cantidad de actividades por semestre y años.
    public ArrayList<Estadistico> consultarActividadesporSemestre_Años(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT YEAR(a.fechacreacion) , a.semestre, COUNT(*) FROM oficina_actividadconvenio a, general_convenio c WHERE a.id_convenio = c.id GROUP BY YEAR(a.fechacreacion), a.semestre");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT YEAR( a.fechacreacion ) , a.semestre, COUNT( * ) FROM oficina_actividadconvenio a, general_convenio c WHERE a.id_convenio = c.id AND c.fechacreacion >=? AND c.fechaterminacion <=? GROUP BY YEAR(a.fechacreacion), a.semestre");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
          
            while(resultado.next()){
                
                String año = resultado.getString(1);
                String semestre = resultado.getString(2);
                int cantidad = resultado.getInt(3);
                
                Estadistico e = new Estadistico(año+"-"+semestre, cantidad);
                System.out.println("--------------------------------"+e.toString());
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
    //Consulta para obtener la cantidad de entidades por sector.
    public ArrayList<Estadistico> consultarEntidadesporSector(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT sector, count(*) FROM `oficina_entidad` GROUP BY sector");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT sector, count(*) FROM `oficina_entidad` o, `general_convenio` c WHERE o.id = c.id_entidad AND c.fechacreacion >=? AND c.fechaterminacion <=? GROUP BY o.sector");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
          
            while(resultado.next()){
                
                String sector = resultado.getString(1);                
                int cantidad = resultado.getInt(2);
                
                Estadistico e = new Estadistico(sector, cantidad);
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
    
    //Consulta para obtener la cantidad de entidades por tipo.
    public ArrayList<Estadistico> consultarEntidadesporTipo(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT tipo, count(*) FROM `oficina_entidad` GROUP BY tipo");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT tipo, count(*) FROM `oficina_entidad` o, `general_convenio` c WHERE o.id = c.id_entidad AND c.fechacreacion >=? AND c.fechaterminacion <=? GROUP BY o.tipo");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
          
            while(resultado.next()){
                
                String tipo = resultado.getString(1);                
                int cantidad = resultado.getInt(2);
                
                Estadistico e = new Estadistico(tipo, cantidad);
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
    //Consulta para obtener la cantidad de estudiantes que hacen actividades por semestre y año.
    public ArrayList<Estadistico> consultarEstudiantesporActividades(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Estadistico> l = new ArrayList();
        
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
            
            if(inicio==null && terminacion==null){
                stm = con.prepareStatement("SELECT YEAR( a.fechacreacion ) , a.semestre, COUNT( * ) \n" +
"FROM oficina_actividadconvenio a, general_convenio c, `oficina_actividadconvenioxgeneral_estudiante` e\n" +
"WHERE a.id = e.`id actividadconvenio` \n" +
"AND a.id_convenio = c.id\n" +
"GROUP BY YEAR(a.fechacreacion), a.semestre");//genero el sql. 
            }
            else if(inicio!=null && terminacion!=null){
                stm = con.prepareStatement("SELECT YEAR( a.fechacreacion ) , a.semestre, COUNT( * ) \n" +
"FROM oficina_actividadconvenio a, general_convenio c, `oficina_actividadconvenioxgeneral_estudiante` e\n" +
"WHERE a.id = e.`id actividadconvenio` \n" +
"AND a.id_convenio = c.id\n" +
"AND c.fechacreacion >= ?\n" +
"AND c.fechaterminacion <= ?\n" +
"GROUP BY YEAR(a.fechacreacion), a.semestre");//genero el sql. 
                stm.setString(1, inicio);
                stm.setString(2, terminacion);
            }
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
          
            while(resultado.next()){
                
                String año = resultado.getString(1);                                
                String semestre = resultado.getString(2);
                int cantidad = resultado.getInt(3);
                
                Estadistico e = new Estadistico(año+"-"+semestre, cantidad);
                l.add(e);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
}
