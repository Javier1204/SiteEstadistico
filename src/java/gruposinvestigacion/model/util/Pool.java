/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gruposinvestigacion.model.util;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author Estudiante
 */
public class Pool {
    private static DataSource datasource;
    private static final String db_url = "jdbc:mysql://sandbox2.ufps.edu.co/ufps_76";
    private static final String db_driver = "com.mysql.jdbc.Driver";
    //"org.gjt.mm.mysql.Driver"
    private static final String db_usuario = "ufps_76";
    private static final String db_contrasena = "ufps_29";
    
    
    private static void inicializarDataSource(){ 
        BasicDataSource dsBasico = new BasicDataSource();
        dsBasico.setDriverClassName(db_driver);
        dsBasico.setUsername(db_usuario);
        dsBasico.setPassword(db_contrasena);
        dsBasico.setUrl(db_url);
        dsBasico.setMaxTotal(100);
        datasource = dsBasico;
    }
    
    public static Connection getConnection() throws SQLException{
        
        if(datasource == null){
            inicializarDataSource();
        }
        return datasource.getConnection();
    }
}