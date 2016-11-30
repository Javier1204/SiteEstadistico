/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.DAO;

import CargaAcademica.DTO.carga_extensionDTO;
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
 * @author jesus
 */
public class carga_extensionDAO {
    
    /**
     * 
     * @param dto
     * @return 
     */
    public String registrarExtension(carga_extensionDTO dto) {
     
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
            String sql="INSERT INTO carga_extension (id_carga,nombre,responsabilidad,unidad,programa,horas_ejecu,horas_progra) "
                    + "values('"+3+"','"+dto.getNombre()+"','"+dto.getResponsabilidad()+"','"+dto.getUnidad()+"','"+dto.getPrograma()+"'"
                    + ",'"+dto.getHoras_ejecu()+"','"+dto.getHoras_progra()+"') ";
                   
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
    
    /**
     * 
     * @return 
     */
    public ArrayList<carga_extensionDTO> listarExtension(){
       
            Pool pool = Conexion.getPool(); //llamo al objeto pool
            Connection con = null;
            PreparedStatement pst = null;
            ArrayList<carga_extensionDTO> lista=new ArrayList<>();
        try {    
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            pst = con.prepareStatement("SELECT * FROM carga_extension");//genero el sql.
            ResultSet resultado=pst.executeQuery();
            carga_extensionDTO e;
            
            while (resultado.next()) {
                e=new carga_extensionDTO();
                e.setNombre(resultado.getString(3));
                e.setResponsabilidad(resultado.getString(4));
                e.setUnidad(resultado.getString(5));
                e.setPrograma(resultado.getString(6));
                e.setHoras_ejecu(resultado.getInt(7));
                e.setHoras_progra(resultado.getInt(8));
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
