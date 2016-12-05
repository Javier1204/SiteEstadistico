/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.DAO;

/**
 *
 * @author WILSON
 */



import ActividadesFormacion.DTO.ActividadDTO;
import ActividadesFormacion.DTO.PonenteDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ufps.util.BaseDeDatos;



public class PonenteDAO {
    
    public static boolean registrarPonente(PonenteDTO a){
       BaseDeDatos.conectar();
//        String sql = "insert into actividades_responsable(cedula,nombre,apellido,nivel_educativo,tipo_vinculacion,correo_personal,titulo,celular,años_experiencia) values (?,?,?,?,?,?,?,?,?)";
        String sql = "insert into actividades_responsable(cedula,nombre,apellido,titulo,celular) values (?,?,?,?,?)";
        Object[] param = new Object[5];
        param[0]= a.getCedula();       
        param[1]=a.getNombre();
        param[2]=a.getApellido();
//        param[3]=a.getNivelEducativo();
//        param[4]=a.getTipoVinculacion();
//        param[5]=a.getCorreoPersonal();
        param[3]=a.getTitulo();
        param[4]=a.getCelular();
//        param[8]=a.getAñosExperiencia();
       
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    
     public static List<PonenteDTO> ListadoPonente() {
        BaseDeDatos.conectar();
        String sql = " SELECT  `cedula`,`nombre`,`apellido`,`nivel_educativo`,`tipo_vinculacion`,`correo_personal`,`titulo`,`celular`,`años_experiencia`,`codigo` FROM `actividades_responsable`  ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        List<PonenteDTO> actividades = new ArrayList<>();
        try {
            while (rs.next()) {
                PonenteDTO acti = new PonenteDTO();
               acti.setCedula(rs.getString(1));
               acti.setNombre(rs.getString(2));
               acti.setApellido(rs.getString(3));            
               acti.setNivelEducativo(rs.getString(4));
               acti.setTipoVinculacion(rs.getString(5));
               acti.setCorreoPersonal(rs.getString(6));
               acti.setTitulo(rs.getString(7));
               acti.setCelular(rs.getString(8));
               acti.setAñosExperiencia(rs.getString(9));
               acti.setCodigo(rs.getInt(10));
              
                actividades.add(acti);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        finally {
        BaseDeDatos.desconectar();
        }  
        return  actividades;
    }
    
    
    
}
