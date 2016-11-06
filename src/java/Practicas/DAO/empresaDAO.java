/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Practicas.DTO.empresaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class empresaDAO {
    
    public String registrarEmpresa(empresaDTO e) {
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
            int idpais=12;
            String representante="mario";
            String tipo="empresa";
            stm = con.prepareStatement("insert into oficina_entidad (id,nit,sector,representante,nombre,ambito,tipo,telefono,id_pais,direccion ) values(null,'"
                    + ""+e.getNIT()+"','"+e.getSectorEmpresa()+"',"+representante+",'"+e.getNombreEmpresa()+"','"+e.getTipoAmbito()+"',"+tipo+",'"+e.getTelefono()+"',"+idpais+",'"+e.getDireccion()+"')");//genero el sql. 
            
            int can = stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement
            
            if(can == 1){
                System.out.println(" registrar");
                return "Se registro la nueva empresa";
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
    
     public ArrayList<empresaDTO> consultarEmpresa() {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<empresaDTO> empresas = new ArrayList();
        
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
            empresaDTO e;
            while(resultado.next()){
                e = new empresaDTO();
                int id = resultado.getInt(1);
                String NIT = resultado.getString(2);
                String sector = resultado.getString(3);
                String nombre = resultado.getString(5);
                String ambito = resultado.getString(6);
                String telefono = resultado.getString(8);
                String direccion = resultado.getString(10);
               
                e.setIdempresa(id);
                e.setNIT(NIT);
                e.setSectorEmpresa(sector);
                e.setNombreEmpresa(nombre);
                e.setTipoAmbito(ambito);
                e.setTelefono(telefono);
                e.setDireccion(direccion);
                
                
                
                empresas.add(e);
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
        return empresas;
    
}
}