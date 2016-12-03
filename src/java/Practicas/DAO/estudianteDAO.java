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
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

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
            //lleveme al jsp
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
        
    }

    public ArrayList<estudianteDTO> listar_Estudiante() {
     Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<estudianteDTO> estudiantes = new ArrayList<>();
        
        try {
            /**
             * 02/11/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("Select * from general_estudiante where asignado_practica = true");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            estudianteDTO e;
            while(resultado.next()){
                e = new estudianteDTO();
                String codigo = resultado.getString(1);
                String documento_id = resultado.getString(2);
                String nombres = resultado.getString(3);
                String apellidos = resultado.getString(4);
                int semestre = resultado.getInt(5);
                               
                e.setCodigoEstudiante(codigo);
                e.setCedula(documento_id);
                e.setNombresEstudiante(nombres);
                e.setApellidosEstudiante(apellidos);
                e.setSemestre(semestre);
                
                
                
                
                estudiantes.add(e);
            }
            
            
            
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no  registrar");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("asdasd no registrar");
                System.err.println(ex);
            }
        }   
        return estudiantes;
    
}          

    @Override
    public List<estudianteDTO> listarEstudiante() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public void subirArhivo(List items, byte opc) throws Exception{
        String nombre= "";
        switch(opc){
            case 1: nombre="cedula";
            break;
            case 2: nombre="horario";
            break;
            case 3: nombre= "hv";
            break;
            case 4: nombre="afiliacion"; 
            break;
        }
        
        
    }
 
    public String pedirDireccion(HttpServletRequest request){
        
        return request.getRealPath("../documentos/Estudiantes");
    }
}
