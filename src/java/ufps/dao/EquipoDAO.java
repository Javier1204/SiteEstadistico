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
import ufps.dto.EquipoDTO;
import ufps.dto.Jornada_DeportivaDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class EquipoDAO {
    public static boolean agregarEquipo(EquipoDTO equipo){
       BaseDeDatos.conectar();
        String sql = "insert into Equipo(nombre_equipo,temporada,codigo_capitan) values (?,?,?)";
        Object[] param = new Object[3]; 
        param[0]=equipo.getNombre_equipo();
        param[1]=equipo.getJornada_deportiva().getTemporada();
        param[2]=equipo.getCapitan_equipo().getCodigo_capitan();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
       public static EquipoDTO buscarEquipoCapitan(CapitanDTO capitan,Jornada_DeportivaDTO jornada) {
        BaseDeDatos.conectar();
        String sql = "SELECT id_equipo,codigo_capitan,nombre_equipo,puntaje,temporada FROM  Equipo where codigo_capitan=? and  temporada=?";
        Object [] param = new Object[2];
        param [0]=capitan.getCodigo_capitan();
         param [1]=jornada.getTemporada();
       ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       EquipoDTO equi = null;
       CapitanDTO cap=null;
       Jornada_DeportivaDTO jor=null;
        try {
            while (rs.next()) {
                  jor=new Jornada_DeportivaDTO();
                  equi= new EquipoDTO();
                  cap=new CapitanDTO();
                  equi.setId_equipo(rs.getInt(1));
                   cap.setCodigo_capitan(rs.getInt(2));
                   equi.setNombre_equipo(rs.getString(3));
                  equi.setPuntos(rs.getInt(4)); 
                   jor.setTemporada(rs.getInt(5));
                  equi.setJornada_deportiva(jor);
                  equi.setCapitan_equipo(cap);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  equi;
    }
     public static EquipoDTO buscarEquipo(EquipoDTO equipo) {
        BaseDeDatos.conectar();
        String sql = "SELECT id_equipo,codigo_capitan,nombre_equipo,puntaje,temporada FROM  Equipo where nombre_equipo=? and temporada=?";
          Object [] param = new Object[2];
         param [0]=equipo.getNombre_equipo();
          param [1]=equipo.getJornada_deportiva().getTemporada();
       ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       EquipoDTO equi = null;
       CapitanDTO cap=null;
       Jornada_DeportivaDTO jor=null;
        try {
            while (rs.next()) {
                   jor=new Jornada_DeportivaDTO();
                  equi= new EquipoDTO();
                  cap=new CapitanDTO();
                  equi.setId_equipo(rs.getInt(1));
                   cap.setCodigo_capitan(rs.getInt(2));
                  equi.setNombre_equipo(rs.getString(3));
                  equi.setPuntos(rs.getInt(4));
                  jor.setTemporada(rs.getInt(5));
                  equi.setJornada_deportiva(jor);
                  equi.setCapitan_equipo(cap);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  equi;
    }

     
    public static EquipoDTO buscarEquipo2(EquipoDTO equipo) {
        BaseDeDatos.conectar();
        String sql = "SELECT id_equipo,codigo_capitan,nombre_equipo,puntaje,temporada FROM  Equipo where id_equipo=?";
          Object [] param = new Object[1];
         param [0]=equipo.getId_equipo();
       ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       EquipoDTO equi = null;
       CapitanDTO cap=null;
       Jornada_DeportivaDTO jor=null;
        try {
            while (rs.next()) {
                   jor=new Jornada_DeportivaDTO();
                  equi= new EquipoDTO();
                  cap=new CapitanDTO();
                  equi.setId_equipo(rs.getInt(1));
                   cap.setCodigo_capitan(rs.getInt(2));
                  equi.setNombre_equipo(rs.getString(3));
                  equi.setPuntos(rs.getInt(4));
                  jor.setTemporada(rs.getInt(5));
                  equi.setJornada_deportiva(jor);
                  equi.setCapitan_equipo(cap);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  equi;
    }
 
     
    public static List<EquipoDTO> poidon(Jornada_DeportivaDTO jorn) {
     BaseDeDatos.conectar();
        String sql = "SELECT nombre_equipo, puntaje \n" +"FROM Equipo\n" +"WHERE temporada =? \n" + "ORDER BY puntaje DESC \n" + "LIMIT 0 , 3";
          Object [] param = new Object[1];
          param[0]=jorn.getTemporada();
       ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       EquipoDTO equi = null;
        List<EquipoDTO>  poidon= new ArrayList<EquipoDTO>();
        try {
            while (rs.next()) {
                  equi= new EquipoDTO();
                  equi.setNombre_equipo(rs.getString(1));
                  equi.setPuntos(rs.getInt(2)); 
                  poidon.add(equi);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  poidon;
    }

    public static List<EquipoDTO> buscarEquipoJornada(Jornada_DeportivaDTO jor) {
       BaseDeDatos.conectar();
       String sql = "SELECT id_equipo,codigo_capitan,nombre_equipo,puntaje,temporada FROM Equipo WHERE  temporada=?";
       Object [] param = new Object[1];
       param[0]=jor.getTemporada();
       ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       EquipoDTO equi = null;
       CapitanDTO cap=null;
       Jornada_DeportivaDTO jorn=null;
       List<EquipoDTO> equipos= new ArrayList<EquipoDTO>();
        try {
            while (rs.next()) {
                   jorn=new Jornada_DeportivaDTO();
                  equi= new EquipoDTO();
                  cap=new CapitanDTO();
                  equi.setId_equipo(rs.getInt(1));
                   cap.setCodigo_capitan(rs.getInt(2));
                  equi.setNombre_equipo(rs.getString(3));
                  equi.setPuntos(rs.getInt(4));
                  jorn.setTemporada(rs.getInt(5));
                  equi.setJornada_deportiva(jor);
                  equi.setCapitan_equipo(cap);
                  equipos.add(equi);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  equipos;
    }
    
    public static  boolean actualizarPuntos(EquipoDTO equipo){
         BaseDeDatos.conectar();
        String sql = " update  Equipo set puntaje=?   where id_equipo=?  ";
        Object[] param = new Object[2]; 
        param[0]=equipo.getPuntos();
        param[1]=equipo.getId_equipo();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    

    public static void AgregarPuntos(EquipoDTO equipo_local,int puntos_ganados) {
        EquipoDTO Equipo = buscarEquipo2(equipo_local);
       if(Equipo!=null){
           System.err.println("sinza");
        int  puntos=Equipo.getPuntos();
        Equipo.setPuntos(puntos+puntos_ganados);
        actualizarPuntos(Equipo);
       }
       }
}
