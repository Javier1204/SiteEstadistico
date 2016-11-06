/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package general.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *la clase GeneralDAO permite métodos que diferentes proyectos pueden utilizar para mayor facilidad y evitar reuso de código.
 * @author Mauricio
 */
public class GeneralDAO {

    /*
    obtenerAsignaturas retorna un ArrayList<Integer> con los códigos de las asignaturas del docente del parámetro
    @params int codigo_doc : código del docente 
    obtener asignaturas de un docente
    obtener nombre/nivel/creditos/etc de asignaturas a partir de los codigos
     */
    public ArrayList<Integer> obtenerAsignaturas(int codig_doc) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        PreparedStatement stmt = null;
        ArrayList<Integer> asignaturas = null;
        try {
            asignaturas = new ArrayList();
            pool.setUsuario("ufps_76");
            pool.setUsuario("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt = con.prepareStatement("SELECT carga_grupo.cod_asignatura\n"
                    + "FROM carga_grupo, carga_carga_academica, general_docente\n"
                    + "WHERE carga_grupo.id_carga = carga_carga_academica.id\n"
                    + "AND carga_carga_academica.codig_doc =?");
            stmt.setInt(1, codig_doc);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                asignaturas.add(rs.getInt(1));
            }
            stmt.close();
            rs.close();
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return asignaturas;
    }
}
