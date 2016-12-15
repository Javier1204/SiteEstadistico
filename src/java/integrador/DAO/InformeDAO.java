/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package integrador.DAO;

import integrador.DTO.InformeDTO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author carlos
 */
public class InformeDAO {
   /**
     * este metodo lista todas las publicaciones registradas de mayor a menor
     * segun el año y semestre
     *
     * @return
     */
    public List<InformeDTO> listarPublicaciones() {
        ArrayList<InformeDTO> lista = new ArrayList();
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("select i.id_informe, i.nombre, i.url_informe, i.modulo, i.descripcion, i.semestre, i.ano from  integrador_informe i  order by i.ano DESC, i.semestre DESC");//genero el sql. 
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InformeDTO p = new InformeDTO();
                p.setId_informe(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setUrl_informe(rs.getString(3));
                p.setModulo(rs.getString(4));
                p.setDescripcion(rs.getString(5));
                p.setSemestre(rs.getInt(6));
                p.setAno(rs.getInt(7));

                lista.add(p);

            }
            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            System.err.println(ex);
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex2) {
                System.err.println(ex2);
            }

        }

        return lista;
    }
    
    /**
     * este metodo lista las publicaciones ordenado de mayor a menor segun año y semestre y  segun un determinado modulo.
     * @param modulo
     * @return 
     */
     public List<InformeDTO> listarPublicacionesModulo(String modulo,int ano,int semestre) {
        ArrayList<InformeDTO> lista = new ArrayList();
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {
             String sql=this.construirSqlConsultarInformeModulos(modulo, ano, semestre);
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(sql);//genero el sql. 
          
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InformeDTO p = new InformeDTO();
                p.setId_informe(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setUrl_informe(rs.getString(3));
                p.setModulo(rs.getString(4));
                p.setDescripcion(rs.getString(5));
                p.setSemestre(rs.getInt(6));
                p.setAno(rs.getInt(7));

                lista.add(p);

            }
            System.err.println(sql);
            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            System.err.println(ex);
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex2) {
                System.err.println(ex2);
            }

        }

        return lista;
    }

     /**
      * este metodo construye la consulta para traerse los infomres segun su modulo año y semestre
      * @param modulo
      * @param ano
      * @param semestre
      * @return 
      */
     private String construirSqlConsultarInformeModulos(String modulo,int ano, int semestre){
         String sqlbase="select i.id_informe, i.nombre, i.url_informe, i.modulo, i.descripcion, i.semestre, i.ano from  integrador_informe i where 1=1";
         if(!modulo.isEmpty()){
         sqlbase +=" and i.modulo = '"+modulo+"'";
         }
         if(ano>-1 ){
         sqlbase +=" and i.ano = "+ano;
         }
         if(semestre>0 && semestre<3){
         sqlbase +=" and i.semestre = "+semestre; 
         }
         sqlbase +=" order by i.ano DESC, i.semestre DESC";
         return sqlbase;
     }
     
}
