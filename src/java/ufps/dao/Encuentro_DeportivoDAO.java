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
import ufps.dto.Disciplina_DeportivaDTO;
import ufps.dto.Encuentro_DeportivoDTO;
import ufps.dto.EquipoDTO;
import ufps.dto.Fecha_DeportivaDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class Encuentro_DeportivoDAO {
   
    public  static boolean  registrarEncuentroDeportivo(Encuentro_DeportivoDTO encuentro){
        BaseDeDatos.conectar();
        System.out.println(encuentro.getDisciplina().getId_disciplina());
        String sql="insert into Encuentro_Deportivo (disciplina,equipo_local,equipo_visitante,fecha,hora,jugado) values(?,?,?,?,?,?)";
        Object [] param= new Object[6];
        param[0]=encuentro.getDisciplina().getId_disciplina();
        param[1]=encuentro.getEquipo_local().getId_equipo();
        param[2]=encuentro.getEquipo_visitante().getId_equipo();
        param[3]=encuentro.getFecha().getId_fecha();
        param[4]=encuentro.getHora();
        param[5]=0;
        boolean consulta = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
         BaseDeDatos.desconectar();
        return consulta;     
    }
    
    public  static boolean registrarResultadoEncuentro(Encuentro_DeportivoDTO encuentro){
         BaseDeDatos.conectar();
         String sql=" UPDATE  Encuentro_Deportivo  SET  marcado_local=? , marcado_visitante=? ,jugado= ?  where id_encuentro=?  ";
          Object [] param= new Object[4];
        param[0]=encuentro.getMarcador_local();
        param[1]=encuentro.getMarcador_visitante();
        param[2]=1;
        param[3]=encuentro.getId_encuentro();
        boolean consulta = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
         BaseDeDatos.desconectar();
      return consulta;
    }
    
    public static  Encuentro_DeportivoDTO buscarEncuentro(Encuentro_DeportivoDTO encuentro){
   BaseDeDatos.conectar();
String sql=" SELECT Encuentro_Deportivo.id_encuentro, Fecha_Deportiva.fecha, Disciplina_Deportiva.nombre_disciplina, Local.nombre_equipo , Vis.nombre_equipo ,  Encuentro_Deportivo.hora,Encuentro_Deportivo.marcado_local,Encuentro_Deportivo.marcado_visitante,Disciplina_Deportiva.id_disciplina, Local.id_equipo , Vis.id_equipo \n" +
"FROM Fecha_Deportiva, Disciplina_Deportiva, Equipo AS\n" +
"Local , Equipo AS Vis, Encuentro_Deportivo\n" +
"WHERE  Encuentro_Deportivo.fecha= Fecha_Deportiva.id_fecha\n" +
"AND Encuentro_Deportivo.disciplina = Disciplina_Deportiva.id_disciplina\n" +
"AND Encuentro_Deportivo.equipo_local = Local.id_equipo\n" +
"AND Encuentro_Deportivo.equipo_visitante = Vis.id_equipo\n" +
"AND Encuentro_Deportivo.jugado=0 \n  and Encuentro_Deportivo.id_encuentro=? ";
 Object [] param= new Object[1];
        param[0]=encuentro.getId_encuentro();            
ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        Encuentro_DeportivoDTO encuentro_deportivo =null;
           Disciplina_DeportivaDTO dis= new Disciplina_DeportivaDTO();
                EquipoDTO local= new EquipoDTO();
                EquipoDTO visitante= new EquipoDTO();
                Fecha_DeportivaDTO fecha=new Fecha_DeportivaDTO();
        try {
            while(rs.next()){
               encuentro_deportivo= new Encuentro_DeportivoDTO();
               encuentro_deportivo.setId_encuentro(rs.getInt(1));
               fecha.setFecha(rs.getString(2));
               dis.setNombre_disciplina(rs.getString(3));
               local.setNombre_equipo(rs.getString(4));
               visitante.setNombre_equipo(rs.getString(5));
               encuentro_deportivo.setHora(rs.getString(6));
               encuentro_deportivo.setMarcador_local(rs.getInt(7));
               encuentro_deportivo.setMarcador_visitante(rs.getInt(8));
               dis.setId_disciplina(rs.getInt(9));
               local.setId_equipo(rs.getInt(10));
               visitante.setId_equipo(rs.getInt(11));
               encuentro_deportivo.setDisciplina(dis);
               encuentro_deportivo.setEquipo_local(local);
               encuentro_deportivo.setEquipo_visitante(visitante);
               encuentro_deportivo.setFecha(fecha);
                
            }
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        } 
        
 return encuentro_deportivo;
    }
    
      
    
         public static List<Encuentro_DeportivoDTO> ListarEncuentroFechaDisciplinaJugado(Encuentro_DeportivoDTO encuentro){
        BaseDeDatos.conectar();
String sql=" SELECT disciplina, equipo_local , equipo_visitante , fecha , hora , marcado_local , marcado_visitante , jugado FROM Encuentro_Deportivo where disciplina=? fecha=? jugado=1 ";
        Object [] param= new Object[2];
        param[0]=encuentro.getDisciplina().getId_disciplina();
        param[1]=encuentro.getFecha().getId_fecha();
       
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql, param);
        Encuentro_DeportivoDTO encuentro_deportivo =null;
           Disciplina_DeportivaDTO dis= new Disciplina_DeportivaDTO();
                EquipoDTO local= new EquipoDTO();
                EquipoDTO visitante= new EquipoDTO();
                Fecha_DeportivaDTO fecha=new Fecha_DeportivaDTO();
               List< Encuentro_DeportivoDTO> encuentros= new  ArrayList< Encuentro_DeportivoDTO>();
        try {
            while(rs.next()){
               encuentro_deportivo= new Encuentro_DeportivoDTO();
               dis.setId_disciplina(rs.getInt(1));
               local.setId_equipo(rs.getInt(2));
               visitante.setId_equipo(rs.getInt(3));
               fecha.setId_fecha(rs.getInt(4));
               encuentro_deportivo.setHora(rs.getString(5));
               encuentro_deportivo.setMarcador_local(rs.getInt(6));
               encuentro_deportivo.setMarcador_visitante(rs.getInt(7));
               encuentro_deportivo.setJugado(rs.getInt(8));
               encuentro_deportivo.setDisciplina(dis);
               encuentro_deportivo.setEquipo_local(local);
               encuentro_deportivo.setEquipo_visitante(visitante);
               encuentro_deportivo.setFecha(fecha);
               encuentros.add(encuentro);
                
            }
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        } 
        
 return encuentros;
    }
     public static List<Encuentro_DeportivoDTO> ListarEncuentroFechaDisciplina(Encuentro_DeportivoDTO encuentro){
      BaseDeDatos.conectar();
String sql=" SELECT Encuentro_Deportivo.id_encuentro, Fecha_Deportiva.fecha, Disciplina_Deportiva.nombre_disciplina, Local.nombre_equipo AS loc, Vis.nombre_equipo AS visi,  Encuentro_Deportivo.hora,Encuentro_Deportivo.marcado_local,Encuentro_Deportivo.marcado_visitante\n" +
"FROM Fecha_Deportiva, Disciplina_Deportiva, Equipo AS\n" +
"Local , Equipo AS Vis, Encuentro_Deportivo\n" +
"WHERE  Encuentro_Deportivo.fecha= Fecha_Deportiva.id_fecha\n" +
"AND Encuentro_Deportivo.disciplina = Disciplina_Deportiva.id_disciplina\n" +
"AND Encuentro_Deportivo.equipo_local = Local.id_equipo\n" +
"AND Encuentro_Deportivo.equipo_visitante = Vis.id_equipo\n" +
"AND Encuentro_Deportivo.jugado=0 \n  and Encuentro_Deportivo.fecha=? and Encuentro_Deportivo.disciplina=? ";
 Object [] param= new Object[2];
        param[0]=encuentro.getDisciplina().getId_disciplina();
        param[1]=encuentro.getFecha().getId_fecha();
               
ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        Encuentro_DeportivoDTO encuentro_deportivo =null;
           Disciplina_DeportivaDTO dis= new Disciplina_DeportivaDTO();
                EquipoDTO local= new EquipoDTO();
                EquipoDTO visitante= new EquipoDTO();
                Fecha_DeportivaDTO fecha=new Fecha_DeportivaDTO();
               List< Encuentro_DeportivoDTO> encuentros= new  ArrayList< Encuentro_DeportivoDTO>();
        try {
            while(rs.next()){
               encuentro_deportivo= new Encuentro_DeportivoDTO();
               encuentro_deportivo.setId_encuentro(rs.getInt(1));
               fecha.setFecha(rs.getString(2));
               dis.setNombre_disciplina(rs.getString(3));
               local.setNombre_equipo(rs.getString(4));
               visitante.setNombre_equipo(rs.getString(5));
               encuentro_deportivo.setHora(rs.getString(6));
               encuentro_deportivo.setMarcador_local(rs.getInt(7));
               encuentro_deportivo.setMarcador_visitante(rs.getInt(8));
               encuentro_deportivo.setDisciplina(dis);
               encuentro_deportivo.setEquipo_local(local);
               encuentro_deportivo.setEquipo_visitante(visitante);
               encuentro_deportivo.setFecha(fecha);
               encuentros.add(encuentro_deportivo);
                
            }
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        } 
        
 return encuentros;
    }
    


public static List<Encuentro_DeportivoDTO> ListarEncuentros(){
        BaseDeDatos.conectar();
String sql=" SELECT Encuentro_Deportivo.id_encuentro, Fecha_Deportiva.fecha, Disciplina_Deportiva.nombre_disciplina, Local.nombre_equipo AS loc, Vis.nombre_equipo AS visi,  Encuentro_Deportivo.hora,Encuentro_Deportivo.marcado_local,Encuentro_Deportivo.marcado_visitante\n" +
"FROM Fecha_Deportiva, Disciplina_Deportiva, Equipo AS\n" +
"Local , Equipo AS Vis, Encuentro_Deportivo\n" +
"WHERE  Encuentro_Deportivo.fecha= Fecha_Deportiva.id_fecha\n" +
"AND Encuentro_Deportivo.disciplina = Disciplina_Deportiva.id_disciplina\n" +
"AND Encuentro_Deportivo.equipo_local = Local.id_equipo\n" +
"AND Encuentro_Deportivo.equipo_visitante = Vis.id_equipo\n" +
"AND Encuentro_Deportivo.jugado=0 \n ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        Encuentro_DeportivoDTO encuentro_deportivo =null;
           Disciplina_DeportivaDTO dis= new Disciplina_DeportivaDTO();
                EquipoDTO local= new EquipoDTO();
                EquipoDTO visitante= new EquipoDTO();
                Fecha_DeportivaDTO fecha=new Fecha_DeportivaDTO();
               List< Encuentro_DeportivoDTO> encuentros= new  ArrayList< Encuentro_DeportivoDTO>();
        try {
            while(rs.next()){
               encuentro_deportivo= new Encuentro_DeportivoDTO();
               encuentro_deportivo.setId_encuentro(rs.getInt(1));
               fecha.setFecha(rs.getString(2));
               dis.setNombre_disciplina(rs.getString(3));
               local.setNombre_equipo(rs.getString(4));
               visitante.setNombre_equipo(rs.getString(5));
               encuentro_deportivo.setHora(rs.getString(6));
               encuentro_deportivo.setMarcador_local(rs.getInt(7));
               encuentro_deportivo.setMarcador_visitante(rs.getInt(8));
               encuentro_deportivo.setDisciplina(dis);
               encuentro_deportivo.setEquipo_local(local);
               encuentro_deportivo.setEquipo_visitante(visitante);
               encuentro_deportivo.setFecha(fecha);
               encuentros.add(encuentro_deportivo);
                
            }
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        } 
        
 return encuentros;
    }


    public static boolean eliminarEncuentro(Encuentro_DeportivoDTO encuentro){
           BaseDeDatos.conectar();
         String sql="DELETE FROM Encuentro_Deportivo  WHERE id_encuentro=?  ";
          Object [] param= new Object[1];
         param[0]=encuentro.getId_encuentro();
        boolean consulta = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
         BaseDeDatos.desconectar();
      return consulta;
    }

    public static Encuentro_DeportivoDTO buscarEncuentro1(Encuentro_DeportivoDTO encuentro) {
    BaseDeDatos.conectar();
String sql=" SELECT disciplina, equipo_local , equipo_visitante , fecha , hora , marcado_local , marcado_visitante , jugado FROM Encuentro_Deportivo where  id_encuentro=? ";
        Object [] param= new Object[1];   
        param[0]=encuentro.getId_encuentro();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql, param);
        Encuentro_DeportivoDTO encuentro_deportivo =null;
           Disciplina_DeportivaDTO dis= new Disciplina_DeportivaDTO();
                EquipoDTO local= new EquipoDTO();
                EquipoDTO visitante= new EquipoDTO();
                Fecha_DeportivaDTO fecha=new Fecha_DeportivaDTO();
        try {
            while(rs.next()){
               encuentro_deportivo= new Encuentro_DeportivoDTO();
               dis.setId_disciplina(rs.getInt(1));
               local.setId_equipo(rs.getInt(2));
               visitante.setId_equipo(rs.getInt(3));
               fecha.setId_fecha(rs.getInt(4));
               encuentro_deportivo.setHora(rs.getString(5));
               encuentro_deportivo.setMarcador_local(rs.getInt(6));
               encuentro_deportivo.setMarcador_visitante(rs.getInt(7));
               encuentro_deportivo.setJugado(rs.getInt(8));
               encuentro_deportivo.setDisciplina(dis);
               encuentro_deportivo.setEquipo_local(local);
               encuentro_deportivo.setEquipo_visitante(visitante);
               encuentro_deportivo.setFecha(fecha);
                
            }
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        } 
        
 return  encuentro_deportivo;
    }
    
    
   
}
