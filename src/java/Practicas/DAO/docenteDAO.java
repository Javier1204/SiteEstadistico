/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import Practicas.DTO.docenteDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class docenteDAO {
    
    
    public docenteDTO buscar_Docente(int codigo) {
        docenteDTO x= new docenteDTO();
        
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from general_docente where codigo = '" +codigo+"'";
        try{
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();
            
            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs= pst.executeQuery();
            
            /** 
             * ESTUDIANTE DTO
             * String codigoEstudiante;     
             * String cedula;     
             * String nombresEstudiante;     
             * String apellidosEstudiante;    
             * int semestre;
             * 
             * 
             * BD: 
             * codigo	varchar(10) ;
                documento_id	varchar(10)
                nombres	varchar(50)
                apellidos	varchar(50)
                semestre	int(11)
                investigacion_codigocolciencias	varchar(10)
                programaacademico	varchar(30)
                activo	tinyint(1)
                asignado_practica	tinyint(1)

             **/
            while(rs.next()){
                x.set_Codigo(rs.getString("codigo"));
                x.setCedulaDocente(rs.getString("cedula"));
                x.setNombreDocente(rs.getString("nombres"));
                x.setApellidosDocente(rs.getString("apellidos"));
                x.setNivelEstudio(rs.getString("nivel_estudio"));
                x.setTipoVinculacion(rs.getString("tipo_vinculacion"));
                x.setEmail2(rs.getString("correo_institucional"));
                x.setEmail(rs.getString("correo_personal"));
                x.setTituloPregrado(rs.getString("titulo_pregrado"));
                x.setCelular(rs.getString("celular"));
                x.setAñosExperiencia(rs.getByte("anos_exp"));
                x.setFechaNacimiento(rs.getDate("fecha_nac"));
                x.setDireccion(rs.getString("direccion_resi"));
            
                System.out.println(x.toString());
            }
            conn.close();
            //lleveme al jsp
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
        
    }
    
}
