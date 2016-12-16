/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.DAO;

import CargaAcademica.DTO.carga_otraDTO;
import CargaAcademica.DTO.general_asignaturaDTO;
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
 * @author Edna helen
 */
public class carga_otraDAO {

    public String registrarOtrasActividades(carga_otraDTO dto, String codigoDoc) {
        
     String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool
        Connection con = null;
        PreparedStatement pst = null;
        try {
          
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario
            con = pool.getDataSource().getConnection();
            //3 es el ID de la carga academica 
            int id=this.obtenerIdCarga(codigoDoc);
            
          
            
            String sql="INSERT INTO carga_otras_actividades (id_carga,nombre,horas_semana) "
                    + "values('"+id+"','"+dto.getNombre()+"','"+dto.getHoras()+"') ";
                   
            pst=con.prepareStatement(sql);
            int a=pst.executeUpdate();
            con.close();
            pst.close();
            if(a==1){
                rta="Registró";
            }
            else{
                rta="No registro";
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(carga_extensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      return rta;
    
    
    }
    
    public ArrayList<carga_otraDTO> obtenerOtrasActividades(String codigoDoc) {
        
            Pool pool = Conexion.getPool(); //llamo al objeto pool
            Connection con = null;
            PreparedStatement pst = null;
            ArrayList<carga_otraDTO> lista=new ArrayList<>();
        try {    
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            
            int id=this.obtenerIdCarga(codigoDoc);
            
            pst = con.prepareStatement("SELECT * FROM carga_otras_actividades where id_carga='"+id+"'");//genero el sql.
            ResultSet resultado=pst.executeQuery();
            carga_otraDTO e;
            
            while (resultado.next()) {
                e=new carga_otraDTO();
                e.setNombre(resultado.getString(3));
                e.setHoras(resultado.getInt(4));
                lista.add(e);
            }
            pst.close();
            con.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(carga_extensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    
    
    public int obtenerIdCarga(String codigoDoc){
            Pool pool = Conexion.getPool(); //llamo al objeto pool
            Connection con = null;
            PreparedStatement pst = null;
            int  id=0;
           
            try {    
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            pst = con.prepareStatement("SELECT id FROM carga_carga_academica where codig_doc='"+codigoDoc+"' ");//genero el sql.
            
          
            ResultSet resultado=pst.executeQuery();
           
             while(resultado.next()){
                id=resultado.getInt(1);
            }
            pst.close();
            con.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(carga_extensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return id;   
    }
    
    
    
}
