/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import Practicas.DTO.perfilDTO;
import Practicas.Interface.PerfilInterface;

import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrador
 */
public class perfilDAO implements PerfilInterface{
    
   
    public String registrarPerfil(perfilDTO p) {
        String rta= "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {
          
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
           
            String sql="insert into practicas_perfil (id_perfil, nombre) values ("+p.getIdperfil()+",'"+p.getNombre()+"')";
            
            pst= con.prepareStatement(sql);
            
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                System.out.println(" registrar");
                rta= "Registro";
            }else{
                 System.out.println("no registrar");
                rta = "No registro";
            }
         
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }

 
    public boolean editarPerfil(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    public boolean eliminarPerfil(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
    public List<perfilDTO> listarPerfiles() {
        List<perfilDTO> lista = new ArrayList <>();
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from practicas_perfil";
        try{
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();
            
            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs= pst.executeQuery();
            
            while(rs.next()){
                lista.add(new perfilDTO(rs.getInt("id_perfil"),rs.getString("nombre")));
            }
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public perfilDTO buscarPerfil(int id) {
        perfilDTO dato = new perfilDTO();
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from practicas_perfil where id_perfil = "+ id;
        try{
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();
            
            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs= pst.executeQuery();
            
            while(rs.next()){
                dato.setIdperfil(rs.getInt("id_perfil"));
                dato.setNombre(rs.getString("nombre"));
            }
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dato;
    }

    
    @Override
    public int id_maximo_perfil() {
        int mx=0;
        try {
            Connection con = null;
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
           
            PreparedStatement pst;
            pst = (PreparedStatement) con.prepareStatement("SELECT * FROM practicas_perfil");//genero el sql. 
            ResultSet resultado = pst.executeQuery();//ejecuto la consulta
            
            while(resultado.next()){
                mx  = resultado.getInt("id_perfil"); 
                System.out.println("Numero maximo: "+mx);
            }
           
            pst.close();//cierro el
         
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mx;
    }
    
   
}
