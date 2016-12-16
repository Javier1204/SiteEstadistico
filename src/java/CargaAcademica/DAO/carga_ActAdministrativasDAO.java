package CargaAcademica.DAO;

import CargaAcademica.DTO.carga_ActAdministrativasDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jesus
 */
public class carga_ActAdministrativasDAO {
    
    /**
     * 
     * @param dto
     * @return 
     */
    public String registrarActAdministrativa(carga_ActAdministrativasDTO dto,String codigoDoc){
        String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool
        Connection con = null;
        PreparedStatement pst = null;
        try {
            System.out.println("entro sql");
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario
            con = pool.getDataSource().getConnection();
           
            int id=this.obtenerIdCarga(codigoDoc);
            System.out.println(dto.getActividad());
            String sql="INSERT INTO carga_act_administrativas (id_carga,cargo,horas_semana,otra_actividad,hora_semana) values"
                    + " ('"+id+"','"+dto.getCargo()+"','"+dto.getHoras_cargo()+"','"+dto.getActividad()+"','"+dto.getHoras_act()+"')";
                   
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
    
    public ArrayList<carga_ActAdministrativasDTO> listarActAdmi(String codigoDoc){
          Pool pool = Conexion.getPool(); //llamo al objeto pool
            Connection con = null;
            PreparedStatement pst = null;
            ArrayList<carga_ActAdministrativasDTO> lista=new ArrayList<>();
        try {    
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            
            int id=this.obtenerIdCarga(codigoDoc);
            
            pst = con.prepareStatement("SELECT * FROM carga_act_administrativas where id_carga='"+id+"'");//genero el sql.
            ResultSet resultado=pst.executeQuery();
            carga_ActAdministrativasDTO e;
            
            while (resultado.next()) {
                e=new carga_ActAdministrativasDTO();
                e.setCargo(resultado.getString(3));
                e.setHoras_cargo(resultado.getInt(4));
                e.setActividad(resultado.getString(5));
                e.setHoras_act(resultado.getInt(6));
               
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
            
             System.out.println("SELECT id FROM carga_carga_academica where codig_doc='"+codigoDoc+"' "); 
            ResultSet resultado=pst.executeQuery();
           
             while(resultado.next()){
                id=resultado.getInt(1);
            }
            
            
            System.out.println("el id es: "+id);
          
            pst.close();
            con.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(carga_extensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return id;   
    }
}
