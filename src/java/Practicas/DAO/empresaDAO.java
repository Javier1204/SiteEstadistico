/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Practicas.DTO.empresaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class empresaDAO {

    public String registrarEmpresa(empresaDTO p) throws SQLException {
        //corra el programa 
        System.out.println(p.toString());
        String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;

        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();

            String sql = "insert into oficina_entidad (NIT,sector,nombre,tipo,telefono,id_pais,direccion) values ('" + p.getNIT() + "','" + p.getSectorEmpresa() + "','" + p.getNombreEmpresa() + "','" + p.getTipoAmbito() + "','" + p.getTelefono() + "','" + p.getPais() +"','" + p.getDireccion() + "')";

            pst = con.prepareStatement(sql);

            int a = pst.executeUpdate();
            

            if (a == 1) {
                System.out.println(" registrar");
                rta = " Se ha Registrado la empresa exitosamente";
            } else {
                System.out.println("no registrar");
                rta = "No registro se ha registrado la empresa";
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.close();
        }
        return rta;
    }

    public String editarEmpresa(empresaDTO p) throws SQLException {
        
        String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;

        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();
            
            String sql = "update  oficina_entidad SET sector='"+p.getSectorEmpresa()+"',nombre='"+p.getNombreEmpresa()+ "',tipo='" + p.getTipoAmbito()+"',telefono='"+p.getTelefono()+"',direccion='" +p.getDireccion()+"' where nit='"+p.getNIT()+"';";
            System.out.println(sql);
            pst = con.prepareStatement(sql);

            int a = pst.executeUpdate();
            con.close();
            
              
            

            if (a == 1) {
                System.out.println(" registrar");
                rta = "Se ha actualizado la empresa";
            } else {
                System.out.println("no registrar");
                rta = "No es posible actualizarla";
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.close();
        }
        return rta;
    }

    public ArrayList<empresaDTO> consultarEmpresa() {
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<empresaDTO> empresas = new ArrayList();

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
            stm = con.prepareStatement("Select * from oficina_entidad");//genero el sql. 

            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            empresaDTO e;
            while (resultado.next()) {
                e = new empresaDTO();
                int id = resultado.getInt(1);
                String NIT = resultado.getString(2);
                String sector = resultado.getString(3);
                String nombre = resultado.getString(5);
                String ambito = resultado.getString(6);
                String telefono = resultado.getString(7);
                String direccion = resultado.getString(9);

                e.setIdempresa(id);
                e.setNIT(NIT);
                e.setSectorEmpresa(sector);
                e.setNombreEmpresa(nombre);
                e.setTipoAmbito(ambito);
                e.setTelefono(telefono);
                e.setDireccion(direccion);

                empresas.add(e);
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
        return empresas;

    }

    public empresaDTO buscarEmpresa(String nit) {
        empresaDTO dato = new empresaDTO();
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from oficina_entidad where nit = " + nit;
        try {
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();

            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {
                dato.setNombreEmpresa(rs.getString("nombre"));
                dato.setNIT(rs.getString("nit"));
                dato.setDireccion(rs.getString("direccion"));
                dato.setTelefono(rs.getString("telefono"));
                dato.setTipoAmbito(rs.getString("tipo"));
                dato.setSectorEmpresa(rs.getString("sector"));
            }
            conn.close();

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dato;
    }

    public String eliminarEmpresa(String nit) throws SQLException {
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        String rta = "No conecto";
        

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
            
            String sql = "DELETE FROM oficina_entidad WHERE nit="+nit+";";
            System.out.println(sql);
            pst = con.prepareStatement(sql);

            int a = pst.executeUpdate();
            con.close();
            
              
            

            if (a == 1) {
                System.out.println(" registrar");
                rta = "Se ha actualizado la empresa";
            } else {
                System.out.println("no registrar");
                rta = "No es posible actualizarla";
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.close();
        }
        return rta;
    }

}
