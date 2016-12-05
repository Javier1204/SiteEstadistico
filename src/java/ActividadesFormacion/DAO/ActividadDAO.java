/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.DAO;

import Practicas.DAO.perfilDAO;
import general.conexion.Conexion;
import general.conexion.Pool;
import ActividadesFormacion.DTO.ActividadDTO;
import ActividadesFormacion.DTO.ConvenioDTO;
import ActividadesFormacion.DTO.EstudianteDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.util.BaseDeDatos;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author WILSON
 */
public class ActividadDAO {
    

    
    
    public static boolean registrarActividad(ActividadDTO a){
       BaseDeDatos.conectar();
        String sql = "insert into actividades_actividad(nombre,responsable_ponente,convenio,siconv,tipo_actividad,fecha_inicio,fechaFin,lugar,organizador) values (?,?,?,?,?,?,?,?,?)";
        Object[] param = new Object[9];
        param[0]=a.getNombre();       
        param[1]=a.getResponsablePonente();
        param[2]=a.getConvenio();
        param[3]=a.getSiconv();
        param[4]=a.getTipoActividad();
        param[5]=a.getFechaInicio();
        param[6]=a.getFechaFin();
        param[7]=a.getLugar();
        param[8]=a.getOrganizador();
       
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    
     public static List<ActividadDTO> ListadoActividad() {
        BaseDeDatos.conectar();
//        String sql = " SELECT  `nombre`,`responsable_ponente`,`convenio`,`siconv`,`tipo_actividad`,`fecha_inicio`,`fechaFin`,`lugar`,`organizador`,`codigo` FROM `actividades_actividad`  ";
        String sql = "SELECT act.`nombre` , res.`nombre` AS ponente, IFNULL (con.`nombre`,'NO TIENE')  AS convenio, act.`siconv` , act.`tipo_actividad` , act.`fecha_inicio` , act.`fechaFin` , act.`lugar` , act.`organizador` , act.`codigo` " +
"FROM  `actividades_actividad` AS act " +
"LEFT JOIN actividades_responsable AS res ON ( res.codigo = act.responsable_ponente ) " +
"LEFT JOIN general_convenio AS con ON ( con.id = act.`convenio` ) ";
        System.out.println(sql);
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        List<ActividadDTO> actividades = new ArrayList<>();
        try {
            while (rs.next()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm");
//                Date ini = rs.getDate(6);
//                Date fin = rs.getDate(6);
//                 String inicon = sdf.format(ini);
//                 String sincon = sdf.format(fin);
//                System.out.println(rs.getString(6));
//                System.out.println(sincon);
                ActividadDTO acti = new ActividadDTO();
               acti.setNombre(rs.getString(1));
               acti.setNomresponsablePonente(rs.getString(2));
               acti.setNomconvenio(rs.getString(3));            
               acti.setSiconv(rs.getInt(4));
               acti.setTipoActividad(rs.getString(5));
//               Timestamp aTimeStamp = rs.getString(6);
               acti.setFechaInicio(rs.getString(6));
//               aTimeStamp = rs.getTimestamp(7);
               acti.setFechaFin(rs.getString(7));
               acti.setLugar(rs.getString(8));
//               System.out.println(rs.getTimestamp(6));
               acti.setOrganizador(rs.getString(9));
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
     
     public static List<ConvenioDTO> ListadoConvenio() {
        BaseDeDatos.conectar();
        String sql = " SELECT  `nombre`,`descripcion`,`id` FROM `general_convenio`  ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        List<ConvenioDTO> actividades = new ArrayList<>();
        try {
            while (rs.next()) {
                ConvenioDTO acti = new ConvenioDTO();
               acti.setNombre(rs.getString(1));
               acti.setDescripcion(rs.getString(2));
               acti.setId(rs.getString(3));            
             
              
              
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
     public static List<EstudianteDTO> ListadoEstudiante() {
        BaseDeDatos.conectar();
        String sql = " SELECT  `codigo`,`nombres` FROM `general_estudiante`  ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        List<EstudianteDTO> actividades = new ArrayList<>();
        try {
            while (rs.next()) {
                EstudianteDTO acti = new EstudianteDTO();
               acti.setCodigo(rs.getString(1));
               acti.setNombre(rs.getString(2));
          
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
     
//     
//     "SELECT act.`codigo`,res.`responsable_ponente` as ponente,con.`nombre` as convenio,act.`tipo_actividad`,act.`fecha_inicio`,act.`fechaFin`,act.`lugar`.act`organizador` , FROM `actividades_actividad` as act left join actividades_responsable as res on (res.codigo=act.responsable_ponente) left join general_convenio as con on (con.id=act.`convenio`)\n" +
//"WHERE act.`convenio`=1"
//    
    
    
    public static List<ActividadDTO> BuscarActividad( ActividadDTO activi) {
        BaseDeDatos.conectar();
      String sql = "SELECT act.`nombre` , res.`nombre` AS ponente, con.`nombre` AS convenio,act.`siconv`, act.`tipo_actividad` , act.`fecha_inicio` , act.`fechaFin` , act.`lugar` , act.`organizador`" +
"FROM  `actividades_actividad` AS act " +
"LEFT JOIN actividades_responsable AS res ON ( res.codigo = act.responsable_ponente ) " +
"LEFT JOIN general_convenio AS con ON ( con.id = act.`convenio` ) WHERE act.codigo=?";
      Object [] param = new Object[1];
         param [0]=activi.getCodigo();        
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);   
        List<ActividadDTO> actividades = new ArrayList<>();
        
        try {
            while (rs.next()) {
               ActividadDTO acti = new ActividadDTO() ;
               acti.setNombre(rs.getString(1));
               acti.setNomresponsablePonente(rs.getString(2));
               acti.setNomconvenio(rs.getString(3));            
               acti.setSiconv(rs.getInt(4));
               acti.setTipoActividad(rs.getString(5));
               acti.setFechaInicio(rs.getString(6));
               acti.setFechaFin(rs.getString(7));
               acti.setLugar(rs.getString(8));
               acti.setOrganizador(rs.getString(9));
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
    
        public static List<ActividadDTO> BuscarActividadSemestre( ActividadDTO activi) {
        BaseDeDatos.conectar();
      String sql = "SELECT act.`nombre` , res.`nombre` AS ponente, con.`nombre` AS convenio,act.`siconv`, act.`tipo_actividad` , act.`fecha_inicio` , act.`fechaFin` , act.`lugar` , act.`organizador` FROM  `actividades_actividad` AS act LEFT JOIN actividades_responsable AS res ON ( res.codigo = act.responsable_ponente ) LEFT JOIN general_convenio AS con ON ( con.id = act.`convenio` ) WHERE act.`fecha_inicio`>=? AND act.`fechaFin`<=? ";
      Object [] param = new Object[2];  
      param [0]=activi.getFechaInicio();        
      param [1]=activi.getFechaFin();        
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);   
        List<ActividadDTO> actividades = new ArrayList<>();
        
        try {
            while (rs.next()) {
               ActividadDTO acti = new ActividadDTO() ;
               acti.setNombre(rs.getString(1));
               acti.setNomresponsablePonente(rs.getString(2));
               acti.setNomconvenio(rs.getString(3));            
               acti.setSiconv(rs.getInt(4));
               acti.setTipoActividad(rs.getString(5));
               acti.setFechaInicio(rs.getString(6));
               acti.setFechaFin(rs.getString(7));
               acti.setLugar(rs.getString(8));
               acti.setOrganizador(rs.getString(9));
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
    
     public static List<EstudianteDTO> BuscarParticipantes( ActividadDTO activi) {
        BaseDeDatos.conectar();
      String sql = "SELECT CONCAT( est.`nombres` ,  ' ', est.`apellidos` )  FROM `actividades_asistente` as asi " +
"left join `general_estudiante` as est on (est.`codigo`=asi.`codigo_estudiante`) " +
"WHERE asi.`codigoActividad`=?";
      Object [] param = new Object[1];
         param [0]=activi.getCodigo();        
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        List<EstudianteDTO> actividades = new ArrayList<>();
      
        try {
            while (rs.next()) {
               EstudianteDTO acti = new EstudianteDTO();
               acti.setNombre(rs.getString(1));
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
     
     
     
     
     public static List<ActividadDTO> BuscarActividadEstu( EstudianteDTO est) {
        BaseDeDatos.conectar();
      String sql = "SELECT act.`nombre` , res.`nombre` AS ponente, con.`nombre` AS convenio, act.`siconv` , act.`tipo_actividad` , act.`fecha_inicio` , act.`fechaFin` , act.`lugar` , act.`organizador` " +
"FROM  `actividades_asistente` AS asi " +
"LEFT JOIN actividades_actividad AS act ON ( act.codigo = asi.codigoActividad )  " +
"LEFT JOIN actividades_responsable AS res ON ( res.codigo = act.responsable_ponente )  " +
"LEFT JOIN general_convenio AS con ON ( con.id = act.`convenio` )  " +
"WHERE asi.codigo_estudiante =?";
      Object [] param = new Object[1];
         param [0]=est.getCodigo();        
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);   
        List<ActividadDTO> actividades = new ArrayList<>();
        
        try {
            while (rs.next()) {
               ActividadDTO acti = new ActividadDTO() ;
               acti.setNombre(rs.getString(1));
               acti.setNomresponsablePonente(rs.getString(2));
               acti.setNomconvenio(rs.getString(3));            
               acti.setSiconv(rs.getInt(4));
               acti.setTipoActividad(rs.getString(5));
               acti.setFechaInicio(rs.getString(6));
               acti.setFechaFin(rs.getString(7));
               acti.setLugar(rs.getString(8));
               acti.setOrganizador(rs.getString(9));
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
