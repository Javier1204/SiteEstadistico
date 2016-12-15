/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import general.conexion.Conexion;
import general.conexion.Pool;
import gestionUsuarios.DTOs.RolDTO;
import gestionUsuarios.DTOs.UsuarioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class GeneralUsuarioRolDAO {
    protected Connection conn;
    public GeneralUsuarioRolDAO(Connection con){conn=con;}
    
    public boolean existe(String rol, String user) {      
        
        try {
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM general_usuario_rol WHERE user=? AND rol=? ");
            ps.setString(1, user);
            ps.setString(2, rol);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                return true;
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            //this.cerrarConexion();
        }
        
    }
    
    public List<RolDTO> obtenerRoles(String user){
        try{
            //obtenerConexion();
            ArrayList<RolDTO> lista =new ArrayList<RolDTO>();
            System.out.println(user);
            PreparedStatement ps=conn.prepareStatement("SELECT rol FROM general_usuario_rol WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                RolDTO rol=null;
                GeneralRolDAO rDAO=new GeneralRolDAO(conn);
                rol=rDAO.getRol(rs.getString(1));
                lista.add(rol);
                System.out.println("ROL: "+rs.getString(1));
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    
    public boolean insertar(String user, String rol){
        try{
            //obtenerConexion();
            System.out.println("llega: "+user+" "+rol);
            PreparedStatement ps=conn.prepareStatement("INSERT INTO general_usuario_rol (user, rol) VALUES (?, ?)");
            ps.setString(1, user);
            ps.setString(2, rol);
            int row=ps.executeUpdate();
            if(row>0){
                return true;
            }
            
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return false;
    }
    
    public void eliminarPorRol(String rol){
        try{
            //obtenerConexion();
            
            PreparedStatement ps=conn.prepareStatement("DELETE FROM `general_usuario_rol` WHERE rol=?");
            ps.setString(1, rol);
            int row=ps.executeUpdate();
            System.out.println(row);
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void eliminar(String usuario, String rol){
        try{
            //obtenerConexion();
            
            PreparedStatement ps=conn.prepareStatement("DELETE FROM `general_usuario_rol` WHERE rol=? AND user=?");
            ps.setString(1, rol);
            ps.setString(2, usuario);
            int row=ps.executeUpdate();
            if(row==1){
                System.out.println("se ha elminado el rol: "+rol+" del usuario"+usuario);
            }else{
                System.out.println("NO se ha elminado el rol: "+rol+" del usuario"+usuario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public void eliminarPorUsuario(String usuario){
        try{
            //obtenerConexion();
            
            PreparedStatement ps=conn.prepareStatement("DELETE FROM `general_usuario_rol` WHERE user=?");
            ps.setString(1, usuario);
            int row=ps.executeUpdate();
            System.out.println(row);
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void crearUsuariosAutomaticos(){
        try{
            ArrayList<String> codigosDocentes=new ArrayList<String>();
            PreparedStatement ps=conn.prepareStatement("SELECT codigo FROM `general_docente` WHERE 1");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                codigosDocentes.add(rs.getString(1));
            }
            for (String codigosDocente : codigosDocentes) {
                GeneralUsuarioDAO gudao=new GeneralUsuarioDAO(conn);
                gudao.insertar(codigosDocente, "12345");
                this.insertar(codigosDocente, "Docente");
            }
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public List<UsuarioDTO> filtrarUsuarios(String pclave){
        ArrayList<UsuarioDTO> usuarios = new ArrayList<>();
        try{
            PreparedStatement ps=conn.prepareStatement("SELECT user FROM general_usuario_rol WHERE rol='"+pclave+"'");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                UsuarioDTO usu=new UsuarioDTO();
                usu.setUssername(rs.getString(1));
                usuarios.add(usu);
            }
            return usuarios;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        GeneralUsuarioRolDAO us=new GeneralUsuarioRolDAO(ConexionGUDAOs.obtenerConexion());
        List<UsuarioDTO> u = us.filtrarUsuarios("Administrador");
        for(UsuarioDTO u1 : u) {
            System.out.println(u1.getUssername());
        }
    }
    
}
