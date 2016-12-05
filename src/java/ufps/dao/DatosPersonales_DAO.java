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
}
