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
import ufps.dto.ArbitroDTO;
import ufps.dto.DatosAcademicos_DTO;
import ufps.dto.DatosPersonales_DTO;
import ufps.dto.Disciplina_DeportivaDTO;
import ufps.dto.Jornada_DeportivaDTO;
import ufps.util.BaseDeDatos;


public class DatosAcademicos_DAO {
    
     public static boolean agregarDataPersonal(DatosAcademicos_DTO datap){
       BaseDeDatos.conectar();
        String sql = "insert into datosacademicos(id_estudiante,colegio_grado,especialidad,ano_grado,valida,idioma,departamento_grado,municipio_grado,ingreso,lectura,naturales,sociales,ingles) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] param = new Object[13];
        param[0]=datap.getId_estudiante();       
        param[1]=datap.getColegio_grado();
        param[2]=datap.getEspecialidad();
        param[3]=datap.getAno_grado();
        param[4]=datap.getValida();
        param[5]=datap.getIdioma();
        param[6]=datap.getDepartamento_grado();
        param[7]=datap.getMunicipio_grado();
        param[8]=datap.getIngreso();
        param[9]=datap.getLectura();
        param[10]=datap.getNaturales();
        param[11]=datap.getSociales();
        param[12]=datap.getIngles();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    public static List<DatosPersonales_DTO> avanzada(String consulta) {
        BaseDeDatos.conectar();
       
        
        ResultSet rs = BaseDeDatos.ejecutarSQL(consulta);
        List<DatosPersonales_DTO>perso = new ArrayList<>();       
        try {
            while (rs.next()) {
                   DatosPersonales_DTO per= new DatosPersonales_DTO();                  
                   per.setNombre(rs.getString(1));
                   per.setApellido(rs.getString(2));
                   per.setGenero(rs.getInt(3));
                   per.setEdad(rs.getInt(4));
                   per.setEstado_civil(rs.getInt(5));
                   perso.add(per);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  perso;
    }  
    
    
}
