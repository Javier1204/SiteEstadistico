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
import ufps.dto.EquipoDTO;
import ufps.dto.IntegranteDTO;
import ufps.dto.Jornada_DeportivaDTO;
import ufps.util.BaseDeDatos;

/**
 *
 * @author jeffersson sinza
 */
public class IntegranteDAO {
    public static boolean insertarIntegrante(IntegranteDTO integrante){
       BaseDeDatos.conectar();
       String sql= "insert into Integrante(codigo_integrante,nombre_integrante,semestre,genero,equipo) values (?,?,?,?,?)";
       Object []param = new Object[5];
       param[0] = integrante.getCodigo_integrante();
       param[1] = integrante.getNombre_integrante();
       param[2] = integrante.getSemestre();
       param[3] = integrante.getGenero();
       param[4] = integrante.getEquipo().getId_equipo();
       boolean consultar =BaseDeDatos.ejecutarActualizacionSQL(sql, param);
       BaseDeDatos.desconectar();
       return consultar;
    }
    
      
    public static  List<IntegranteDTO> listadoIntegranteEquipo(EquipoDTO equipo){
        BaseDeDatos.conectar();
        String sql = "select  codigo_integrante,nombre_integrante,semestre,genero,equipo from Integrante where  equipo=?";
        Object[] param= new Object[1];
        param[0]=equipo.getId_equipo();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        
        List<IntegranteDTO> integrantes = new ArrayList<>();
        try {
            while (rs.next()) {
                IntegranteDTO inte= new IntegranteDTO();
                EquipoDTO equi=new EquipoDTO(); 
                inte.setCodigo_integrante(rs.getInt(1));
                inte.setNombre_integrante(rs.getString(2));
                inte.setSemestre(rs.getInt(3));
                inte.setGenero(rs.getString(4));
                equi.setId_equipo(rs.getInt(5));
                inte.setEquipo(equi);
               integrantes.add(inte);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        finally{
             BaseDeDatos.desconectar();
        }
        return integrantes;
    }    
    
     public static IntegranteDTO buscarIntegrante(IntegranteDTO inte) {
        BaseDeDatos.conectar();
        String sql = "SELECT codigo_integrante,nombre_integrante,semestre,genero,equipo FROM  Integrante where codigo_integrante=? and  equipo=?";
          Object [] param = new Object[2];
         param [0]=inte.getCodigo_integrante();
          param [1]=inte.getEquipo().getId_equipo();
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        IntegranteDTO capi = null;

        try {
            while (rs.next()) {
                EquipoDTO equi=new EquipoDTO(); 
                   capi= new IntegranteDTO();
                   capi.setCodigo_integrante(rs.getInt(1));
                   capi.setNombre_integrante(rs.getString(2));
                   capi.setSemestre(rs.getInt(3));
                   capi.setGenero(rs.getString(4));
                   equi.setId_equipo(rs.getInt(5));
                   capi.setEquipo(equi);
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  capi;
    }
     
     public static List<IntegranteDTO>  integranteEquipoTemporada(Jornada_DeportivaDTO jor){
          BaseDeDatos.conectar();
         String sql="SELECT  Integrante.codigo_integrante, Integrante.nombre_integrante, Integrante.semestre, Integrante.genero, Equipo.nombre_equipo  FROM Integrante, Equipo " +
" WHERE Integrante.equipo = Equipo.id_equipo AND Equipo.temporada= ? ";
         Object [] param = new Object[1];
         param [0]=jor.getTemporada() ;
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql,param);
        IntegranteDTO capi = null;
        List<IntegranteDTO> integrantes= new ArrayList<>();
        try {
            while (rs.next()) {
                   EquipoDTO equi=new EquipoDTO(); 
                   capi= new IntegranteDTO();
                   capi.setCodigo_integrante(rs.getInt(1));
                   capi.setNombre_integrante(rs.getString(2));
                   capi.setSemestre(rs.getInt(3));
                   capi.setGenero(rs.getString(4));
                   equi.setNombre_equipo(rs.getString(5));
                   capi.setEquipo(equi);
                   integrantes.add(capi);
                
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
       finally {
        BaseDeDatos.desconectar();
        }  
        return  integrantes;
         
     }

    public static boolean eliminarIntegrante(IntegranteDTO integrante) {
     BaseDeDatos.conectar();
       String sql= "delete from Integrante where codigo_integrante=? and  equipo=?";
       Object []param = new Object[2];
       param[0] = integrante.getCodigo_integrante();
       param[1] = integrante.getEquipo().getId_equipo();
       boolean consultar =BaseDeDatos.ejecutarActualizacionSQL(sql, param);
       BaseDeDatos.desconectar();
       return consultar;
    }
     
     
}
