/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import Practicas.DTO.tutor_empresaDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
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
public class tutorDAO {
    
    public String registrarTutor(tutor_empresaDTO p) {
        //corra el programa 
        System.out.println(p.toString());
        String rta= "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {
          
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
           
            String sql="insert into practicas_tutor_empresa (nombre,telefono,cargo,email) values ('"+p.getNombreTutor()+"','"+p.getTelefono()+"','"+p.getCargo()+"','"+p.getEmail()+"')";
            
            pst= con.prepareStatement(sql);
            
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                System.out.println(" registrar");
                rta= "Se ha registrado el tutor satisfactoriamente";
            }else{
                 System.out.println("no es posible registrarlo");
                rta = "No registro";
            }
            
         
        } catch (SQLException ex) {
            Logger.getLogger(tutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }
    
    public ArrayList<tutor_empresaDTO> consultarTutor() {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<tutor_empresaDTO> tutores = new ArrayList();
        
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
            stm = con.prepareStatement("Select * from practicas_tutor_empresa");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            tutor_empresaDTO e;
            while(resultado.next()){
                e = new tutor_empresaDTO();
                int id = resultado.getInt(1);
                String nombre = resultado.getString(2);
                String telefono = resultado.getString(3);
                String cargo = resultado.getString(4);
                String email = resultado.getString(5);
                
                e.setIdtutor(id);
                e.setNombreTutor(nombre);
                e.setTelefono(telefono);
                e.setCargo(cargo);
                e.setEmail(email);
                             
                
                tutores.add(e);
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
        return tutores;
    
}
    
}
