/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.DAO;

/**
 *
 * @author luxx
 */
import ufps.dao.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ufps.dto.DatosAcademicos_DTO;
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
    
    
    
    
}
