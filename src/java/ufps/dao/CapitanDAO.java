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
import ufps.dto.CapitanDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class CapitanDAO {
    
    
  public static boolean agregarCapitan(CapitanDTO capitan){
       BaseDeDatos.conectar();
        String sql = "insert into Capitan(codigo_capitan,correo_electronico,contrasena,nombre_capitan) values (?,?,?,?)";
        Object[] param = new Object[4];
        param[0]=capitan.getCodigo_capitan();
        param[1]=capitan.getCorreo_electronico();
        param[2]=capitan.getContrasena();
        param[3]=capitan.getNombre_capitan();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    public static  boolean editarCapitan(CapitanDTO capitan){
        BaseDeDatos.conectar();
        String sql="update Capitan set contrasena= ?,correo_electronico=? , nombre_capitan=?  where codigo_capitan= ? ";
        Object [] param= new Object[4];
        param [0]=capitan.getContrasena();
        param [1]=capitan.getCorreo_electronico();
        param [2]= capitan.getNombre_capitan();
        param [3]=capitan.getCodigo_capitan();
        boolean consultar =   BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    public static  boolean borrarCapitan(CapitanDTO capitan){
        BaseDeDatos.conectar();
        String sql="delete  from Capitan where  codigo_capitan=?";
         Object [] param = new Object[1];
         param [0]=capitan.getCodigo_capitan();
         boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
         BaseDeDatos.desconectar();
         return consultar;
         
    }
    
     public static CapitanDTO buscarCapitan(CapitanDTO capitan) {
        BaseDeDatos.conectar();
        String sql = "SELECT codigo_capitan,correo_electronico,contrasena,nombre_capitan FROM  Capitan where codigo_capitan=?";
          Object [] param = new Object[1];
         param [0]=capitan.getCodigo_capitan();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        CapitanDTO capi = null;

        try {
            while (rs.next()) {
                   capi= new CapitanDTO();
                   capi.setCodigo_capitan(rs.getInt(1));
                   capi.setCorreo_electronico(rs.getString(2));
                   capi.setContrasena(rs.getString(3));
                   capi.setNombre_capitan(rs.getString(4));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  capi;
    }
    
    public static List<CapitanDTO> ListadoCapitanes() {
        BaseDeDatos.conectar();
        String sql = "SELECT codigo_capitan,correo_electronico,contrasena,nombre_capitan FROM Capitan ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        List<CapitanDTO> capitanes = new ArrayList<>();

        try {
            while (rs.next()) {
                CapitanDTO capi= new CapitanDTO();
                   capi.setCodigo_capitan(rs.getInt(1));
                   capi.setCorreo_electronico(rs.getString(2));
                   capi.setContrasena(rs.getString(3));
                   capi.setNombre_capitan(rs.getString(4));
                capitanes.add(capi);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  capitanes;
    }

    public static CapitanDTO validarCapitan(CapitanDTO capitan) {
          BaseDeDatos.conectar();
        String sql = "SELECT codigo_capitan,correo_electronico,contrasena,nombre_capitan FROM  Capitan where correo_electronico=? and  contrasena=? ";
          Object [] param = new Object[2];
          param [0]=capitan.getCorreo_electronico();
          param [1]=capitan.getContrasena();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        CapitanDTO capi = null;

        try {
            while (rs.next()) {
                   capi= new CapitanDTO();
                   capi.setCodigo_capitan(rs.getInt(1));
                   capi.setCorreo_electronico(rs.getString(2));
                   capi.setContrasena(rs.getString(3));
                   capi.setNombre_capitan(rs.getString(4));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  capi;
    }
    }
    
    
    

   

