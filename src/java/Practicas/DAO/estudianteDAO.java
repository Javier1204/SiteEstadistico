/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import Practicas.Interface.EstudianteInterface;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Practicas.DTO.estudianteDTO;

/**
 *
 * @author Administrador
 */
public class estudianteDAO implements EstudianteInterface{

    @Override
    public String registrarEstudiante() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String actualizarEstudiante(estudianteDAO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public estudianteDTO buscarEstudiante(int codigo) {
        estudianteDTO x= new estudianteDTO();
        
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from general_estudiante where codigo = '" + codigo+"'";
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
                x.setCodigoEstudiante(rs.getString("codigo"));
                x.setCedula(rs.getString("documento_id"));
                x.setNombresEstudiante(rs.getString("nombres"));
                x.setApellidosEstudiante(rs.getString("apellidos"));
                x.setSemestre(rs.getInt("semestre"));
            }
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
        
    }

    @Override
    public List<estudianteDTO> listarEstudiante() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
 
}
