/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.DAO;

/**
 *
 * @author WILSON
 */

import ActividadesFormacion.DTO.ActividadDTO;
import ActividadesFormacion.DTO.AsistenciaDTO;
import ActividadesFormacion.DTO.PonenteDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ufps.util.BaseDeDatos;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import database.Db_Connection;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;

public class AsistenciaDAO {
    
     public static boolean registrarAsistencia(AsistenciaDTO a){
       BaseDeDatos.conectar();
        String sql = "insert into actividades_asistente(codigoActividad,codigo_estudiante) values (?,?)";
        Object[] param = new Object[2];
        param[0]=a.getCodigoActividad();       
        param[1]=a.getCodigoEstudiante();
       
       
        boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
        BaseDeDatos.desconectar();
        return consultar;
    }
    
    
     public static List<AsistenciaDTO> ListadoActividad() {
        BaseDeDatos.conectar();
        String sql = " SELECT  `codigoActividad`,`codigo_estudiante`,`id_asis` FROM `actividades_asistente`  ";
        ResultSet rs = BaseDeDatos.ejecutarSQL(sql);
        List<AsistenciaDTO> actividades = new ArrayList<>();
        try {
            while (rs.next()) {
                AsistenciaDTO acti = new AsistenciaDTO();
               acti.setCodigoActividad(rs.getInt(1));
               acti.setCodigoEstudiante(rs.getInt(2));
               acti.setId_asi(rs.getInt(3));
              
              
                actividades.add(acti);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        finally {
        BaseDeDatos.desconectar();
        }  
        return  actividades;
    }
     
     public static  boolean actividad(int codigoActividad,int codigoEstudiante, InputStream inputStream,long size)
            throws ServletException, IOException 
    {
        
    
              
                try 
                {
                    Db_Connection dbconn=new Db_Connection();
                    Connection conn= dbconn.Connection();
//                    int tamano=Integer.parseInt(size);
//                    String sql = "INSERT INTO files (id, title, file) values (?, ?, ?)";
                    String sql = "insert into actividades_asistente(codigoActividad,codigo_estudiante,imagen) values (?,?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setInt(1, codigoActividad);
                    statement.setInt(2, codigoEstudiante);
             
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(3, inputStream, (int) size);
                    }
                    
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                       
                        
                        conn.close();
                        
                    
                        return true;
                    }
                    else
                    {
                       
                        
                        conn.close();
                      
                        return false;

                    }    

                }catch(Exception e){e.printStackTrace();}     
                return false;
    }   
    
    
     public static  boolean actividad2(HttpServletRequest request)
            throws ServletException, IOException 
    {
        
    
              
                try 
                {
                    BaseDeDatos.conectar();
//                    int tamano=Integer.parseInt(size);
//                    String sql = "INSERT INTO files (id, title, file) values (?, ?, ?)";


                           
                InputStream inputStream = null;

                System.out.println(request.getParameter("codigoActividad"));
                System.out.println(request.getParameter("codigoEstudiante"));
                
                int codigoActividad=Integer.parseInt(request.getParameter("codigoActividad"));
                int codigoEstudiante=Integer.parseInt(request.getParameter("codigoEstudiante"));
                Part filePart = request.getPart("file_uploaded");
                
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }









       BaseDeDatos.conectar();
    
      





                    String sql = "insert into actividades_asistente(codigoActividad,codigo_estudiante,imagen) values (?,?,?)";
                     Object[] param = new Object[2];
                     param[0]=codigoActividad;       
                     param[1]=codigoEstudiante;
//                    PreparedStatement statement = conn.prepareStatement(sql);
//                    statement.setInt(1, codigoActividad);
//                    statement.setInt(2, codigoEstudiante);
//             
                    if (inputStream != null) 
                    {
                         param[1]=inputStream;
                    }
                    
//                    int row = statement.executeUpdate();
                      boolean consultar = BaseDeDatos.ejecutarActualizacionSQL(sql, param);
       
       
                    if (consultar) 
                    {
                       
                        
                        BaseDeDatos.desconectar();
                        
                    
                        return true;
                    }
                    else
                    {
                       
                        
                         BaseDeDatos.desconectar();
                      
                        return false;

                    }    

                }catch(Exception e){e.printStackTrace();}     
                return false;
    }   
    
    
    
    
    
}
