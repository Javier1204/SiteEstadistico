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
import ufps.dto.ArbitroDTO;
import ufps.dto.Disciplina_DeportivaDTO;
import ufps.dto.Jornada_DeportivaDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class ArbitroDAO {
    public static boolean agregarArbitro(ArbitroDTO arbitro){
       BaseDeDatos.conectar();
        String sql = "insert into Arbitro(documento,nombre_arbitro,disciplina) values (?,?,?)";
        Object[] param = new Object[3];
        param[0]=arbitro.getDocumento();
        param[1]=arbitro.getNombre_arbitro();
        param[2]=arbitro.getDisciplina_deportiva().getId_disciplina();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    public static  boolean editarArbitro(ArbitroDTO capitan){
        BaseDeDatos.conectar();
        String sql="update Arbitro set nombre_arbitro= ? where documento= ? ";
        Object [] param= new Object[2];
        param [0]=capitan.getNombre_arbitro();
        param [1]=capitan.getDocumento();
        boolean consultar =   BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    public static  boolean borrarArbitro(ArbitroDTO arbitro){
        BaseDeDatos.conectar();
        String sql="delete  from Arbitro where documento=? ";
         Object [] param = new Object[1];
         param [0]=arbitro.getDocumento();
         boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
         BaseDeDatos.desconectar();
         return consultar;
         
    }
    
    
    
     public static ArbitroDTO buscarArbitro(ArbitroDTO arbitro) {
        BaseDeDatos.conectar();
        String sql = "SELECT documento,disciplina,nombre_arbitro FROM  Arbitro  WHERE documento=?";
          Object [] param = new Object[1];
         param [0]=arbitro.getDocumento();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        ArbitroDTO arbi = null;
        Disciplina_DeportivaDTO dis = null;
        try {
            while (rs.next()) {
                   arbi= new ArbitroDTO();
                   dis=new Disciplina_DeportivaDTO();
                   arbi.setDocumento(rs.getInt(1));
                    dis.setId_disciplina(rs.getInt(2));
                    arbi.setNombre_arbitro(rs.getString(3));
                   arbi.setDisciplina_deportiva(dis);
                   
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  arbi;
    }
      public static ArbitroDTO buscarArbitroDisciplina(Disciplina_DeportivaDTO disci) {
        BaseDeDatos.conectar();
        String sql = "SELECT documento,disciplina,nombre_arbitro FROM  Arbitro where  disciplina=?";
          Object [] param = new Object[1];
        param [0]=disci.getId_disciplina();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        ArbitroDTO arbi = null;
        Disciplina_DeportivaDTO dis = null;
        try {
            while (rs.next()) {
                   arbi= new ArbitroDTO();
                   dis=new Disciplina_DeportivaDTO();
                   arbi.setDocumento(rs.getInt(1));
                     dis.setId_disciplina(rs.getInt(2));
                      arbi.setNombre_arbitro(rs.getString(3));
                   arbi.setDisciplina_deportiva(dis);
                   
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  arbi;
    }
      
     public static List<ArbitroDTO> listadoArbitro(Jornada_DeportivaDTO jor) {
        BaseDeDatos.conectar();
        String sql = "SELECT Disciplina_Deportiva.`nombre_disciplina` , Arbitro.`nombre_arbitro` , Arbitro.`documento` \n" +
"FROM Disciplina_Deportiva, Arbitro\n" +
"WHERE Disciplina_Deportiva.`id_disciplina` = Arbitro.`disciplina` AND Disciplina_Deportiva.`temporada` =? ";
        Object [] param = new Object[1];
        param[0]= jor.getTemporada();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
       List<ArbitroDTO>arbitros = new ArrayList<>();
        Disciplina_DeportivaDTO dis= null;
        try {
            while (rs.next()) {
                  ArbitroDTO arbitro= new ArbitroDTO();
                   dis=new Disciplina_DeportivaDTO();
                   arbitro.setNombre_arbitro(rs.getString(2));
                   arbitro.setDocumento(rs.getInt(3));
                   dis.setNombre_disciplina(rs.getString(1));
                   arbitro.setDisciplina_deportiva(dis);
                   arbitros.add(arbitro);
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  arbitros;
    }  
      
 
}