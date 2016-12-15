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
import ufps.dto.Jornada_DeportivaDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class Disciplina_DeportivaDAO {
 
     public static boolean agregarDisciplina(Disciplina_DeportivaDTO dis) {
        BaseDeDatos.conectar();
        String sql = "insert into Disciplina_Deportiva(nombre_disciplina,puntos,temporada)  values(?,?,?)";
        Object[] param = new Object[3]; 
        param[0]=dis.getNombre_disciplina();
        param[1]=dis.getPuntos();
        param[2]=dis.getJornada_deportiva().getTemporada();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }

    public static boolean editarDisciplina(Disciplina_DeportivaDTO  dis) {
        BaseDeDatos.conectar();
        String sql = "UPDATE  Disciplina_Deportiva  set puntos=? , nombre_disciplina=? where id_disciplina=?";
        Object[] param = new Object[3];
        System.err.println(dis.getPuntos()+"."+dis.getNombre_disciplina()+"."+dis.getId_disciplina());
        param[0] = dis.getPuntos();
        param[1] = dis.getNombre_disciplina();
        param[2] = dis.getId_disciplina();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }

    public static boolean borrarDisciplina(Disciplina_DeportivaDTO  dis) {
        BaseDeDatos.conectar();
        String sql = "delete from   Disciplina_Deportiva  where id_disciplina=? ";
        Object[] param = new Object[1];
        param[0] = dis.getId_disciplina();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    public static List<Disciplina_DeportivaDTO > listadoDisciplina(Jornada_DeportivaDTO jor){
        BaseDeDatos.conectar();
        String sql = "select id_disciplina,nombre_disciplina,puntos,temporada from Disciplina_Deportiva  where  temporada= ?";
        Object[] param = new Object[1];
        param[0] = jor.getTemporada();
          ResultSet rs = BaseDeDatos.ejecutarSQL(sql, param);
          List<Disciplina_DeportivaDTO > disciplinas = new ArrayList<>();
        try {
            while (rs.next()) {
                Disciplina_DeportivaDTO  disciplina = new Disciplina_DeportivaDTO ();  
                disciplina.setId_disciplina(rs.getInt(1));
                disciplina.setNombre_disciplina(rs.getString(2));
                disciplina.setPuntos(rs.getInt(3));
                jor.setTemporada(rs.getInt(4));
                disciplina.setJornada_deportiva(jor);
                disciplinas.add(disciplina);   
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
         finally{
              BaseDeDatos.desconectar();
        }
        return disciplinas;
    }
         
        
    
    public static Disciplina_DeportivaDTO  buscarDisciplina(Disciplina_DeportivaDTO  disci){
        BaseDeDatos.conectar();
        String sql = "select id_disciplina,nombre_disciplina,puntos,temporada from Disciplina_Deportiva  where id_disciplina=?";
        Object[] param = new Object[1];
        param[0] = disci.getId_disciplina();
         ResultSet rs = BaseDeDatos.ejecutarSQL(sql, param);
      Disciplina_DeportivaDTO disciplina = null;
        try {
            while (rs.next()) {
                  disciplina = new Disciplina_DeportivaDTO ();
                Jornada_DeportivaDTO jor = new Jornada_DeportivaDTO();
                disciplina.setId_disciplina(rs.getInt(1));
                disciplina.setNombre_disciplina(rs.getString(2));
               disciplina.setPuntos(rs.getInt(3));
                jor.setTemporada(rs.getInt(4));
                disciplina.setJornada_deportiva(jor);
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
         finally{
              BaseDeDatos.desconectar();
        }
        return disciplina;
    }
    
}
