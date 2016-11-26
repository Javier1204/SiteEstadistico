/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Internacionalizacion.Modelo.DTO.Actividad;
import Internacionalizacion.Modelo.DTO.Pais;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JAVIER
 */
public class DAOPais {
    
    public DAOPais(){
        
    }
    
    public ArrayList<Pais> consultarPaises() {
        Pool pool = Conexion.getPool();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        Pais pais = null;
        ArrayList<Pais> paises = new ArrayList<>();
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt = con.prepareStatement("Select * from oficina_pais");            
            rs = stmt.executeQuery();
                                 
            
            while(rs.next()){
                pais = new Pais();
                
                int id = rs.getInt(1);
                String nombre = rs.getString(2);                
                pais.setId(id);
                pais.setNombre(nombre);
                paises.add(pais);
                
            }
                 
            stmt.close();
            rs.close();
                                   
           
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            System.out.println("error en consultar paises");
            
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DAOPais.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
       return paises;
    }
    
}
