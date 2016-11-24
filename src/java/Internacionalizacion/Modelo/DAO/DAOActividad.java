/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Internacionalizacion.Modelo.DTO.Actividad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JAVIER
 */
public class DAOActividad {
    
    public boolean RegistrarActividad(Actividad a) {
        Pool pool = Conexion.getPool();
        Connection con = null;
        ResultSet rs = null;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `oficina_actividadconvenio`(`id_convenio`, `duracion`, `nombre`, `fechacreacion`, `fechaterminacion`, `semestre`, `tipoactividad`, `hora`, `responsable`, `lugar`, `descripcion`) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            //fijar atributos
            //stmt.setArray(), x);
            stmt.setInt(1, a.getIdconvenio());
            stmt.setString(2, a.getDuracion());
            stmt.setString(3, a.getNombre());
            stmt.setString(4, a.getFechacreacion());
            stmt.setString(5, a.getFechaterminacion());
            stmt.setShort(6, a.getSemestre());
            stmt.setString(7, a.getTipoactividad());
            stmt.setString(8, a.getHora());
            stmt.setString(9, a.getResponsable());
            stmt.setString(10, a.getLugar());
            stmt.setString(11, a.getDescripcion());
            
            stmt.executeUpdate();
           
            stmt.close();
            
            System.out.println("Se registro la actividad!");
            
            rs.close();
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            return false;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DAOActividad.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
       return true;
    }
    
    public Actividad consultarActividad_By_IDConvenio(int convenio) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        Actividad a = null;
        
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
            stm = con.prepareStatement("SELECT * FROM `oficina_actividadconvenio` WHERE `id_convenio`=?");//genero el sql. 
            stm.setInt(1, convenio);
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            while(resultado.next()){
                a = new Actividad();
                int id = resultado.getInt(1);
                int id_convenio = resultado.getInt(2);
                String duracion = resultado.getString(3);
                String nombre = resultado.getString(4);
                String creacion = resultado.getString(5);
                String terminacion = resultado.getString(6);
                String semestre = resultado.getString(7);
                String tipo_actividad = resultado.getString(8);
                String hora = resultado.getString(9);
                String responsable = resultado.getString(10);
                String lugar = resultado.getString(11);
                String descripcion = resultado.getString(12);
                               
                a.setId(id);
                a.setIdconvenio(id_convenio);
                a.setDescripcion(descripcion);
                a.setDuracion(duracion);
                a.setFechacreacion(creacion);
                a.setFechaterminacion(terminacion);
                a.setNombre(nombre);
                a.setLugar(lugar);
                a.setResponsable(responsable);
                a.setSemestre(Short.parseShort(semestre));
                a.setTipoactividad(tipo_actividad);
                a.setHora(hora);
                
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
        return a;
    }
}
