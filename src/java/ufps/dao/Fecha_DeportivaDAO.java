/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
import ufps.dto.Fecha_DeportivaDTO;
import ufps.dto.Jornada_DeportivaDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class Fecha_DeportivaDAO {
    public static boolean insertarFechaDeportiva(Fecha_DeportivaDTO fec){
        BaseDeDatos.conectar();
        String sql = "insert Fecha_Deportiva (fecha,temporada) values (?,?)";
        Object[] param = new Object[2];
        param[0]=fec.getFecha();
        param[1]=fec.getJornada().getTemporada();
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;  
    }
    
     public  static  List<Fecha_DeportivaDTO> buscarFechaDeportiva(Jornada_DeportivaDTO jor){
        BaseDeDatos.conectar();
        String sql = "select id_fecha,fecha,temporada from Fecha_Deportiva  where  temporada=? ";
        Object[] param = new Object[1];
        param [0]=jor.getTemporada();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql, param); 
      List<Fecha_DeportivaDTO> fechas =new ArrayList<>();
         try {
            while (rs.next()) {
                Jornada_DeportivaDTO jorn=new Jornada_DeportivaDTO();
                Fecha_DeportivaDTO fecha=new   Fecha_DeportivaDTO();
                fecha.setId_fecha(rs.getInt(1));
                fecha.setFecha(rs.getString(2));
                jorn.setTemporada(rs.getInt(3));
                fecha.setJornada(jorn);
                fechas.add(fecha);
      
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
         finally{
                BaseDeDatos.desconectar();
         }
        return fechas;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
