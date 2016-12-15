/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.UsuarioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class GeneralUsuarioDAO {
    protected Connection conn;
    public GeneralUsuarioDAO(Connection con){conn=con;}
    
    public String getPass(String user)
    {
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT password FROM general_usuario WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                return rs.getString(1);
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            //cerrarConexion();
        }
    }
    
    public UsuarioDTO getUsuario(String user){
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM general_usuario WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                UsuarioDTO u=new UsuarioDTO();
                u.setUssername(rs.getString(1));
                u.setPassword(rs.getString(2));
                
                return u;
            }
            return null;
        } catch (SQLException ex) {
            
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            //cerrarConexion();
        }
        
    }
    public void cargarNombre(UsuarioDTO usu){
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT nombres, apellidos FROM general_docente WHERE codigo=?");
            ps.setString(1, usu.getUssername());
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                String nombre=rs.getString(1);
                String apellido=rs.getString(2);
                usu.setNombre(nombre+" "+apellido);
                return;
            }
            System.out.println("Usuario :"+usu.getUssername()+" No existe");
            
        } catch (SQLException ex) {
            
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            //cerrarConexion();
        }
    }
    public boolean existeUser(String user){
        try{
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM general_usuario WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean insertar(String user, String pass){
        try{
            PreparedStatement ps=conn.prepareStatement("INSERT INTO general_usuario (user, password) VALUES (?, ?)");
            ps.setString(1, user);
            ps.setString(2, pass);
            int row=ps.executeUpdate();
            if(row==1){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public ArrayList<UsuarioDTO> listarUsuarios(){
        try{
            ArrayList<UsuarioDTO> lista=new ArrayList<UsuarioDTO>();
            PreparedStatement ps=conn.prepareStatement("SELECT user, password FROM general_usuario");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                UsuarioDTO usu=new UsuarioDTO();
                usu.setUssername(rs.getString(1));
                usu.setPassword(rs.getString(2));
                lista.add(usu);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public boolean eliminar(String usuario){
        try{
            PreparedStatement ps=conn.prepareStatement("DELETE FROM general_usuario WHERE user=?");
            ps.setString(1, usuario);
            int row=ps.executeUpdate();
            if(row==1)return true;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean modificar(String usuario, String pass){
        try{
            PreparedStatement ps=conn.prepareStatement("UPDATE general_usuario SET password=? WHERE user=?");
            ps.setString(2, usuario);
            ps.setString(1, pass);
            int row=ps.executeUpdate();
            if(row==1)return true;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
   
    
    public static void main(String[] args) {
        GeneralUsuarioDAO us=new GeneralUsuarioDAO(ConexionGUDAOs.obtenerConexion());
        
    }
}
