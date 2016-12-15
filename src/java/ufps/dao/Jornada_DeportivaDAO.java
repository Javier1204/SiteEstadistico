package ufps.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.dto.Jornada_DeportivaDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class Jornada_DeportivaDAO {
       
    public static boolean insertarJornadaDeportiva(Jornada_DeportivaDTO jor){
        BaseDeDatos.conectar();
        String sql = "insert into Jornada_Deportiva (fecha_inicio,fecha_fin,estado) VALUES (?,?,?)";
        Object[] param = new Object[3]; 
          System.err.println(jor.getFecha_fin()+"_"+jor.getFecha_inicio());
        param[0]=jor.getFecha_inicio();
        param[1]=jor.getFecha_fin();
        param[2]="Activa";
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;  
    }
    
    public static boolean FinalizarJornadaDeportiva(Jornada_DeportivaDTO jor){
        BaseDeDatos.conectar();
        String sql = "update  Jornada_Deportiva set estado=? where temporada =?";
        Object[] param = new Object[2];
        param[0]="inactiva";
        param[1]=jor.getTemporada();        
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;  
    }
    
    public  static Jornada_DeportivaDTO buscarJornada_Deportiva(Jornada_DeportivaDTO jor){
        BaseDeDatos.conectar();
        String sql = "select temporada,fecha_inicio,fecha_fin,estado from Jornada_Deportiva  where  fecha_inicio=? or fecha_fin=? ";
        Object[] param = new Object[2];
        System.err.println(jor.getFecha_fin()+"-"+jor.getFecha_inicio());
       param [0]= jor.getFecha_inicio();
        param[1]= jor.getFecha_fin();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql, param);
       Jornada_DeportivaDTO jornada =null;
      
         try {
            while (rs.next()) {
                jornada= new Jornada_DeportivaDTO();
                jornada.setFecha_inicio(rs.getString(2));
                jornada.setFecha_fin(rs.getString(3));
                jornada.setEstado(rs.getString(4));
                jornada.setTemporada(rs.getInt(1));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
         finally{
                BaseDeDatos.desconectar();
         }
        return jornada;
    }
   
    public  static Jornada_DeportivaDTO buscarJornada_DeportivaActiva(){
        BaseDeDatos.conectar();
        String sql = "select  temporada,fecha_inicio,fecha_fin,estado from Jornada_Deportiva  where  estado='activa' ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
       Jornada_DeportivaDTO jornada =null;
         try {
            while (rs.next()) {
                jornada= new Jornada_DeportivaDTO();
                jornada.setFecha_inicio(rs.getString(2));
                jornada.setFecha_fin(rs.getString(3));
                jornada.setEstado(rs.getString(4));
                jornada.setTemporada(rs.getInt(1));
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
         finally{
                BaseDeDatos.desconectar();
         }
        return jornada;
    }

    public static List<Jornada_DeportivaDTO> jornadaAnteriores() {
   BaseDeDatos.conectar();
        String sql = "select  temporada,fecha_inicio,fecha_fin,estado from Jornada_Deportiva  where  estado='inactiva' ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
         List<Jornada_DeportivaDTO> jornadas=new ArrayList<>();
         try {
            while (rs.next()) {
              Jornada_DeportivaDTO  jornada= new Jornada_DeportivaDTO();
                jornada.setFecha_inicio(rs.getString(2));
                jornada.setFecha_fin(rs.getString(3));
                jornada.setEstado(rs.getString(4));
                jornada.setTemporada(rs.getInt(1));
                jornadas.add(jornada);
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
         finally{
                BaseDeDatos.desconectar();
         }
        return jornadas;
    }

   
    
}
