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
import ufps.dto.UsuarioDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson
 */
public class UsuarioDAO {
    public static boolean agregarUsuario(UsuarioDTO Usuario){
       BaseDeDatos.conectar();
        String sql = "insert into usuario(codigo,correo_electronico,contrasena,nombre,tipo) values (?,?,?,?,?)";
        Object[] param = new Object[5];
        param[0]=Usuario.getCodigo();
        param[1]=Usuario.getCorreo_electronico();
        param[2]=Usuario.getContrasena();
        param[3]=Usuario.getNombre();
        param[4]=Usuario.getTipo();
       
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    public static  boolean editarUsuario(UsuarioDTO Usuario){
        BaseDeDatos.conectar();
        String sql="update usuario set contrasena=?,nombre=?  where codigo=? ";
        Object [] param= new Object[3];
        param [0]=Usuario.getContrasena();
        param [1]=Usuario.getNombre();
        param [2]=Usuario.getCodigo();
      
        boolean consultar =   BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    public static  boolean borrarUsuario(UsuarioDTO Usuario){
        BaseDeDatos.conectar();
        String sql="delete  from usuario where  codigo=?";
         Object [] param = new Object[1];
         param [0]=Usuario.getCodigo();
         boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
         BaseDeDatos.desconectar();
         return consultar;
         
    }
    
    public static  int cantUsers(){
        BaseDeDatos.conectar();
        String sql="SELECT COUNT(*) FROM `usuario` WHERE `tipo`='Estudiante'";
      
       ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
         int cat=0;
          try {
            while (rs.next()) {
                  
                  cat=rs.getInt(1);
                 
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
         BaseDeDatos.desconectar();
         return cat;
         
    }
    
    
    
    
    
     public static UsuarioDTO buscarUsuario(UsuarioDTO Usuario) {
        BaseDeDatos.conectar();
        String sql = "SELECT codigo,correo_electronico,contrasena,nombre,tipo FROM  usuario where codigo=?";
          Object [] param = new Object[1];
         param [0]=Usuario.getCodigo();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       UsuarioDTO Usu= null;

        try {
            while (rs.next()) {
                     Usu= new UsuarioDTO();
                   Usu.setCodigo(rs.getInt(1));
                   Usu.setCorreo_electronico(rs.getString(2));
                   Usu.setContrasena(rs.getString(3));
                   Usu.setNombre(rs.getString(4));
                   Usu.setTipo(rs.getString(5));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  Usu;
    }
    
    public static List<UsuarioDTO> ListadoUsuario() {
        BaseDeDatos.conectar();
        String sql = "SELECT codigo,correo_electronico,contrasena,nombre,tipo FROM usuario ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        List<UsuarioDTO> Usuarios = new ArrayList<>();
UsuarioDTO Usu= null;
        try {
            while (rs.next()) {
                
                    Usu= new UsuarioDTO();
                   Usu.setCodigo(rs.getInt(1));
                   Usu.setCorreo_electronico(rs.getString(2));
                   Usu.setContrasena(rs.getString(3));
                   Usu.setNombre(rs.getString(4));
                   Usu.setTipo(rs.getString(5));
                Usuarios.add(Usu);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  Usuarios;
    }

    public static UsuarioDTO validarUsuario(UsuarioDTO Usuario) {
          BaseDeDatos.conectar();
        String sql = "SELECT codigo,correo_electronico,contrasena,nombre,tipo FROM  usuario where correo_electronico=? and  contrasena=?  ";
          Object [] param = new Object[2];
          param [0]=Usuario.getCorreo_electronico();
          param [1]=Usuario.getContrasena();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       UsuarioDTO Usu = null;

        try {
            while (rs.next()) {
                   Usu= new UsuarioDTO();
                   Usu.setCodigo(rs.getInt(1));
                   Usu.setCorreo_electronico(rs.getString(2));
                   Usu.setContrasena(rs.getString(3));
                   Usu.setNombre(rs.getString(4));
                Usu.setTipo(rs.getString(5));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  Usu;
    }
}
