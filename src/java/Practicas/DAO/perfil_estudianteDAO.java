/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import Practicas.DTO.perfil_estudianteDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class perfil_estudianteDAO {
    

 public String agregarPerfilEstudiante(int perfil, int valor, int codEstudiante) {
        String rta= "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {
          
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
            perfil_estudianteDTO p= new perfil_estudianteDTO(codEstudiante, perfil, valor,  false);
            //int codigoestudiante, int idperfil, int valor, Date fecha, boolean estado
            String sql="insert into practicas_perfilxestudiante (id_perfil, codigo, valor, estado) values ("+p.getIdperfil()+","+p.getCodigoestudiante()+","+p.getValor()+","+p.getEstado()+")";
            
            pst= con.prepareStatement(sql);
            
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                System.out.println("registrar");
                rta= "Registro";
            }else{
                 System.out.println("no registrar");
                rta = "No registro";
            }
         
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }    

    public List<perfil_estudianteDTO> listarPerfilesEstudiante(int cod) {
        List<perfil_estudianteDTO> lista = new ArrayList <>();
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from practicas_perfilxestudiante where codigo = "+cod;
        try{
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();
            
            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs= pst.executeQuery();
            
            while(rs.next()){
                perfil_estudianteDTO pd= new perfil_estudianteDTO();
                pd.setIdperfil(rs.getInt("id_perfil"));
                pd.setValor(rs.getInt("valor"));
                lista.add(pd);
                
            }
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    
}
