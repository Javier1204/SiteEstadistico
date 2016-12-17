/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufps.dao;

/**
 *
 * @author luxx
 */

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ufps.dto.DatosPersonales_DTO;
import ufps.dto.UsuarioDTO;
import ufps.util.BaseDeDatos;


public class DatosPersonales_DAO {
     public static boolean agregarDataPersonal(DatosPersonales_DTO datap){
       BaseDeDatos.conectar();
        String sql = "insert into datospersonales(id_estudiante,nombre,apellido,tipo_documento,documento,fecha_nacimiento,pais,departamento,municipio,genero,edad,estado_civil) values (?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] param = new Object[12];
        param[0]=datap.getId_estudiante();       
        param[1]=datap.getNombre();
        param[2]=datap.getApellido();
        param[3]=datap.getTipo_documento();
        param[4]=datap.getDocumento();
        param[5]=datap.getFecha_nacimiento();
        param[6]=datap.getPais();
        param[7]=datap.getDepartamento();
        param[8]=datap.getMunicipio();
        param[9]=datap.getGenero();
        param[10]=datap.getEdad();
        param[11]=datap.getEstado_civil();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
     
      public static DatosPersonales_DTO buscarUsuario(UsuarioDTO Usuario) {
        BaseDeDatos.conectar();
        String sql = "SELECT `id_estudiante`, `nombre`, `apellido`, `tipo_documento`, `documento`, `fecha_nacimiento`, `pais`, `departamento`, `municipio`, `genero`, `edad`, `estado_civil` FROM `datospersonales` WHERE `id_estudiante`=?";
          Object [] param = new Object[1];
         param [0]=Usuario.getCodigo();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       DatosPersonales_DTO usu= null;

        try {
            while (rs.next()) {
                              
                     usu= new DatosPersonales_DTO();
                 usu.setId_estudiante(rs.getString(1));
                 usu.setNombre(rs.getString(2));
                 usu.setApellido(rs.getString(3));
                 usu.setTipo_documento(rs.getInt(4));
                 usu.setDocumento(rs.getDouble(5));
                 usu.setFecha_nacimiento(rs.getString(6));
                 usu.setPais(rs.getInt(7));
                 usu.setDepartamento(rs.getInt(8));
                 usu.setMunicipio(rs.getInt(9));
                 usu.setGenero(rs.getInt(10));
                 usu.setEdad(rs.getInt(11));
                 usu.setEstado_civil(rs.getInt(12));
                 
                 
                
//                   Usu.setCodigo(rs.getInt(1));
//                   Usu.setCorreo_electronico(rs.getString(2));
//                   Usu.setContrasena(rs.getString(3));
//                   Usu.setNombre(rs.getString(4));
//                   Usu.setTipo(rs.getString(5));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  usu;
    }
      
       public static  boolean editarPersonal(DatosPersonales_DTO datap){
        BaseDeDatos.conectar();
        String sql="update datospersonales set nombre= ?,apellido=? , tipo_documento=? , documento=?, fecha_nacimiento=?, pais=?, departamento=?, municipio=?, genero=?, edad=?, estado_civil=? where id_estudiante= ? ";
        Object [] param= new Object[12];
         
        
        
            
        param[0]=datap.getNombre();
        param[1]=datap.getApellido();
        param[2]=datap.getTipo_documento();
        param[3]=datap.getDocumento();
        param[4]=datap.getFecha_nacimiento();
        param[5]=datap.getPais();
        param[6]=datap.getDepartamento();
        param[7]=datap.getMunicipio();
        param[8]=datap.getGenero();
        param[9]=datap.getEdad();
        param[10]=datap.getEstado_civil();
        param[11]=datap.getId_estudiante();  
         
 
        boolean consultar =   BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
     
     
}
