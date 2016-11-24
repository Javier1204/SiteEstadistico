/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Internacionalizacion.Modelo.DTO.Entidad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author HeinerV
 */
public class DAOEntidad {

    public String registrarEntidad(Entidad e) {
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
            stm = con.prepareStatement("insert into oficina_entidad(id,nombre,representante,sector,tipo, telefono,id_pais,nit,direccion) values(null,'"+e.getNombre()+"','"+e.getRepresentante()+"','"+e.getSector()+",'"+e.getTipo()+"','"+e.getTelefono()+"','"+e.getPais()+"','"+e.getNit()+"','"+e.getDireccion()+"')");//genero el sql. 
                  
            
            int can = stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement
            
            if(can == 1){
                System.out.println(" Se registro entidad");
                return "Se registro entidad";
            }else{
                 System.out.println("no registro entidad");
                return "No se registro entidad";
            }
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no  registro entidad");
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
    
     public ArrayList<Entidad> consultarEntidades() {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Entidad> entidades = new ArrayList();
        
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
            stm = con.prepareStatement("Select * from oficina_entidad");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            Entidad e;
            while(resultado.next()){
                e = new Entidad();
                int id = resultado.getInt(1);
                String nit = resultado.getString(2);
                String sector = resultado.getString(3);
                String representante = resultado.getString(4);
                String nombre = resultado.getString(5);                
                String tipo = resultado.getString(6);
                String telefono = resultado.getString(7);
                int pais = resultado.getInt(8);
               
                e.setId(id);
                e.setNIT(nit);
                e.setSector(sector);
                e.setRepresentante(representante);
                e.setNombre(nombre);
                e.setTelefono(telefono);
                e.setTipo(tipo);
                e.setPais(pais);
                System.out.println("Entidad: "+e.toString());
                entidades.add(e);
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
        return entidades;
    }
   
}
