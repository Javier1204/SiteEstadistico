/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.DAO;

import CargaAcademica.DTO.carga_extensionDTO;
import CargaAcademica.DTO.carga_grupoDTO;
import CargaAcademica.DTO.general_asignaturaDTO;
import CargaAcademica.DTO.observacionesDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author estudiante
 */
public class docenciaDAO {

    
    public String registrarDocencia(carga_grupoDTO dto){
    
     String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool
        Connection con = null;
        PreparedStatement pst = null;
        try {
            System.out.println("entro sql de docencia");
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario
            con = pool.getDataSource().getConnection();
            //3 es el ID de la carga academica 
            String sql="INSERT INTO carga_grupo (id_carga,cod_asignatura,grupo,num_estu,horas_teo,horas_teoprac,horas_prac) "
                    + "values('"+3+"','"+dto.getCod_asignatura()+"','"+dto.getGrupo()+"','"+dto.getNum_estu()+"','"+dto.getHoras_teo()+"'"
                    + ",'"+dto.getHoras_teoprac()+"','"+dto.getHoras_prac()+"') ";
                   
            pst=con.prepareStatement(sql);
            int a=pst.executeUpdate();
            con.close();
            pst.close();
            if(a==1){
                rta="Registró";
            }
            else{
                rta="No registro";
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(carga_extensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      return rta;
    
    }
    
    
    public ArrayList<general_asignaturaDTO> obtenerAsignaturas() {
        
            Pool pool = Conexion.getPool(); //llamo al objeto pool
            Connection con = null;
            PreparedStatement pst = null;
            ArrayList<general_asignaturaDTO> lista=new ArrayList<>();
        try {    
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            pst = con.prepareStatement("SELECT * FROM general_asignatura");//genero el sql.
            ResultSet resultado=pst.executeQuery();
            general_asignaturaDTO e;
            
            while (resultado.next()) {
                e=new general_asignaturaDTO();
                e.setNombre(resultado.getString(2));
                e.setCodigo(resultado.getString(1));
                e.setCreditos(resultado.getInt(4));
                lista.add(e);
            }
            pst.close();
            con.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(carga_extensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public String registrarObservacion(observacionesDTO dto) {
        String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool
        Connection con = null;
        PreparedStatement pst = null;
        try {
            System.out.println("entro sql de observacion");
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario
            con = pool.getDataSource().getConnection();
          
            
            String sql="INSERT INTO carga_observacion (cod_docente,actividad,aprobado,comentario) "
                + "values('"+1+"','"+dto.getActividad()+"','"+dto.getAprobado()+"','"+dto.getComentario()+"')";
            
            System.out.println(sql);
            
            
            
            
            pst=con.prepareStatement(sql);
            int a=pst.executeUpdate();
            con.close();
            pst.close();
            if(a==1){
                rta="Registró";
            }
            else{
                rta="No registro";
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(carga_extensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      return rta;
    }
   
}
