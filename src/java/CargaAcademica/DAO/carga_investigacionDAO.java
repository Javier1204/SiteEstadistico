/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.DAO;

import CargaAcademica.DTO.carga_investigacionDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.*;


/**
 *
 * @author jesus
 */
public class carga_investigacionDAO {

    public String regsitrarInvestigacion(carga_investigacionDTO dto) {
        String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool
        Connection con = null;
        PreparedStatement pst = null;
        try {
            System.out.println("entro sql");
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario
            con = pool.getDataSource().getConnection();
            //3 es el ID de la carga academica 
           
            String sql="INSERT INTO carga_investigacion (id_carga,cod_acta,nombre,responsabilidad,unidad_investigacion,institucion,"
                    + "horas_semana) values"
                    + " ('"+3+"','"+dto.getCod_acta()+"','"+dto.getNombre()+"','"+dto.getResponsabilidad()+"','"+dto.getUnidad_investigativa()+"'"
                    + ",'"+dto.getInstitucion()+"','"+dto.getHoras_semana()+"')";
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

    public ArrayList<carga_investigacionDTO> obtenerInvestigaciones() {
      
            Pool pool = Conexion.getPool(); //llamo al objeto pool
            Connection con = null;
            PreparedStatement pst = null;
            ArrayList<carga_investigacionDTO> lista=new ArrayList<>();
        try {    
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            pst = con.prepareStatement("SELECT * FROM carga_investigacion");//genero el sql.
            ResultSet resultado=pst.executeQuery();
            carga_investigacionDTO e;
            
            while (resultado.next()) {
                e=new carga_investigacionDTO();
                e.setCod_acta(resultado.getInt(3));
                e.setNombre(resultado.getString(4));
                e.setResponsabilidad(resultado.getString(5));
                e.setUnidad_investigativa(resultado.getString(6));
                e.setInstitucion(resultado.getString(7));
                e.setHoras_semana(resultado.getInt(8));
                lista.add(e);
            }
            pst.close();
            con.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(carga_extensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
    
    
    

