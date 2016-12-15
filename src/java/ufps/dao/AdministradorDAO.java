/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ufps.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ufps.dto.AdministradorDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class AdministradorDAO {
  
    
    public  static boolean agregarAdministrador(AdministradorDTO admin){
       BaseDeDatos.conectar();
        String sql = "insert into Administrador  values (?,?,?)";
        Object[] param = new Object[3];
        param[0]=admin.getCorreo_electronico();
        param[1]=admin.getContrasena();
        param[2]=admin.getNombre_administrador();
       
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
       public  static String agregarAdministrador1(AdministradorDTO admin){
       BaseDeDatos.conectar();
        String sql = "insert into Administrador (correo_electronico, contrasena, nombre_administrador) values (?,?,?)";
        Object[] param = new Object[3];
        param[0]=admin.getCorreo_electronico();
        param[1]=admin.getContrasena();
        param[2]=admin.getNombre_administrador();
        String []error= new String[1];
        error[0]="sinza";
        boolean consultar = BaseDeDatos.ejecutarActualizacion1SQL(sql, param,error);
        BaseDeDatos.desconectar();
        return error[0];
    }
    
       public static  boolean editarAdministrador(AdministradorDTO  admin){
        BaseDeDatos.conectar();
        String sql=" update  Administrador set contrasena=? , nombre_administrador=?  where correo_electronico=? ";
        Object [] param= new Object[3];
        param [0]= admin.getContrasena();
        param [1]= admin.getNombre_administrador();
        param [2]= admin.getCorreo_electronico();
        boolean consultar =   BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    public static  boolean borrarAdministrador(AdministradorDTO admin){
        BaseDeDatos.conectar();
        String sql="delete  from Administrador where  correo_electronico=?";
         Object [] param = new Object[1];
         param [0]=admin.getCorreo_electronico();
         boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
         BaseDeDatos.desconectar();
         return consultar;
         
    }
    
    
    public static List<AdministradorDTO> ListadoAdministrador() {
        BaseDeDatos.conectar();
        String sql = "select correo_electronico, contrasena, nombre_administrador from Administrador ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        List<AdministradorDTO> administradores = new ArrayList<>();
        try {
            while (rs.next()) {
                AdministradorDTO admin = new AdministradorDTO();
               admin.setCorreo_electronico(rs.getString(1));
               admin.setContrasena(rs.getString(2));
               admin.setNombre_administrador(rs.getString(3));
                administradores.add(admin);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        finally {
        BaseDeDatos.desconectar();
        }  
        return  administradores;
    }
   public static AdministradorDTO BuscarAdministrador( AdministradorDTO administrador) {
        BaseDeDatos.conectar();
        String sql = "select correo_electronico, contrasena, nombre_administrador from Administrador where  correo_electronico=? and contrasena=?";
         Object [] param = new Object[2];
         param [0]=administrador.getCorreo_electronico();
          param [1]=administrador.getContrasena();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);    
        AdministradorDTO admin = null;
        try {
            while (rs.next()) {
                 admin = new AdministradorDTO();
               admin.setCorreo_electronico(rs.getString(1));
               admin.setContrasena(rs.getString(2));
               admin.setNombre_administrador(rs.getString(3));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        finally {
        BaseDeDatos.desconectar();
        }  
        return  admin;
    }
public static AdministradorDTO BuscarAdministrador1( AdministradorDTO administrador) {
        BaseDeDatos.conectar();
        String sql = "select correo_electronico, contrasena, nombre_administrador from Administrador where  correo_electronico=? ";
         Object [] param = new Object[1];
         param [0]=administrador.getCorreo_electronico();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);    
        AdministradorDTO admin = null;
        try {
            while (rs.next()) {
                 admin = new AdministradorDTO();
               admin.setCorreo_electronico(rs.getString(1));
               admin.setContrasena(rs.getString(2));
               admin.setNombre_administrador(rs.getString(3));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        finally {
        BaseDeDatos.desconectar();
        }  
        return  admin;
    }

    public static AdministradorDTO validarAdministrador(AdministradorDTO administrador) {
          BaseDeDatos.conectar();
        String sql = "select correo_electronico, contrasena, nombre_administrador from Administrador where  correo_electronico=? and contrasena=?";
         Object [] param = new Object[2];
         param [0]=administrador.getCorreo_electronico();
         param [1]=administrador.getContrasena();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);    
        AdministradorDTO admin = null;
        try {
            while (rs.next()) {
                 admin = new AdministradorDTO();
               admin.setCorreo_electronico(rs.getString(1));
               admin.setContrasena(rs.getString(2));
               admin.setNombre_administrador(rs.getString(3));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        finally {
        BaseDeDatos.desconectar();
        }  
        return  admin;
    }
    
      
}


