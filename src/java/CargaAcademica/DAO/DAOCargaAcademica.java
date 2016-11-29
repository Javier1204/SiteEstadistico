
package CargaAcademica.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/

public class DAOCargaAcademica {
    
    public String consultarOtrasDeDocente(String codigo){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT i.id,i.nombre,i.horas_semana from carga_otras_actividades i where i.id_carga= (select c.id from general_docente d join carga_carga_academica c where d.codigo=c.codig_doc and d.codigo="+codigo+")");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+="-"+resultado.getString(3);
                total+=",";
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
       
        if(total==""){total="No hay-Actividades-Otras,";}
        return total;
    }
    
    public String consultarAdministracionDeDocente(String codigo){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT i.id,i.cargo,i.horas_semana,i.otra_actividad,i.hora_semana from carga_act_administrativas i where i.id_carga= (select c.id from general_docente d join carga_carga_academica c where d.codigo=c.codig_doc and d.codigo="+codigo+")");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+="-"+resultado.getString(3);
                total+="-"+resultado.getString(4);
                total+="-"+resultado.getString(5);
                total+=",";
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
       
        if(total==""){total="No-hay-Actividades-Administración-Docente,";}
        return total;
    }    
    
    public String consultarExtensionDeDocente(String codigo){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT i.id,i.nombre,i.responsabilidad,i.unidad,i.programa,i.horas_semana,i.descripcion from carga_extension i where i.id_carga= (select c.id from general_docente d join carga_carga_academica c where d.codigo=c.codig_doc and d.codigo="+codigo+")");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+="-"+resultado.getString(3);
                total+="-"+resultado.getString(4);
                total+="-"+resultado.getString(5);
                total+="-"+resultado.getString(6);
                 total+="-"+resultado.getString(7);
                total+=",";
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
       
        if(total==""){total="No-hay-Actividades-Extensión-de-Docente-Seleccionado,";}
        return total;
    }   
    
       public String consultarInvestigacionDeDocente(String codigo){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT i.cod_acta,i.nombre,i.responsabilidad,i.unidad_investigacion,i.institucion,i.horas_semana from carga_investigacion i where i.id_carga=( select c.id from general_docente d join carga_carga_academica c where d.codigo=c.codig_doc and d.codigo="+codigo+")");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+="-"+resultado.getString(3);
                total+="-"+resultado.getString(4);
                total+="-"+resultado.getString(5);
                total+="-"+resultado.getString(6);
                total+=",";
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
       
        if(total==""){total="No-hay-Actividades-Investigacion-de-Docente,";}
        return total;
    }
       
       public String consultarDocenciaDeDocente(String codigo){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT g.cod_asignatura,g.grupo,a.nombre,a.creditos,g.num_estu,a.nivel from carga_grupo g join general_asignatura a where g.id_carga=(select c.id from general_docente d join carga_carga_academica c where d.codigo=c.codig_doc and d.codigo="+codigo+") and g.cod_asignatura=a.codigo");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+="-"+resultado.getString(3);
                total+="-"+resultado.getString(4);
                total+="-"+resultado.getString(5);
                total+="-"+resultado.getString(6);
                total+=",";
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
       
        if(total==""){total="No-hay-Actividades-Docencia-de-Docente,";}
        return total;
    }

       public String consultarDocentesHorasDocencia(){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("SELECT d.codigo,d.nombres,d.apellidos,sum(c.horas_teo) \n" +
"        from carga_grupo c join general_docente d join carga_carga_academica a\n" +
"        where c.id_carga=a.id and a.codig_doc=d.codigo\n" +
"        GROUP by c.id_carga");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+="-"+resultado.getString(4);
                total+=",";
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
       
        if(total==""){total="No hay Docentes-Horas Docencia-0,";}
        return total;
    }
    
       public String consultarDocentesCatedra(){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("SELECT codigo,nombres,apellidos from general_docente where tipo_vinculacion='catedra'");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+=",";
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
       
        if(total==""){total="No hay Docentes-Catedra,";}
        return total;
    }
       
       public String consultarDocentesMedio(){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("SELECT codigo,nombres,apellidos from general_docente where tipo_vinculacion='medio tiempo'");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+=",";
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
       
        if(total==""){total="No hay Docentes-Medio Tiempo,";}
        return total;
    }
     
       public String consultarDocentesCompleto(){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("SELECT codigo,nombres,apellidos from general_docente where tipo_vinculacion='tiempo completo'");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+=",";
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
       
        if(total==""){total="No hay Docentes-Tiempo Completo,";}
        return total;
    }
    
       public String consultarDocentesAdministrativos(){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT DISTINCT (d.codigo),d.nombres,d.apellidos \n" +
                    "FROM general_docente as d join carga_carga_academica as c join carga_act_administrativas as g\n" +
                    "where g.id_carga=c.id and c.codig_doc=d.codigo order by d.apellidos");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+=",";
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
       
        if(total==""){total="No hay Docentes-Administrativos,";}
        return total;
    } 
    
    
       public String consultarDocentesExtension(){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT DISTINCT (d.codigo),d.nombres,d.apellidos \n" +
                    "FROM general_docente as d join carga_carga_academica as c join carga_extension as g\n" +
                    "where g.id_carga=c.id and c.codig_doc=d.codigo order by d.apellidos");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+=",";
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
        if(total==""){total="No hay Docentes-en Extensión,";}
        return total;
    }  
    
      public String consultarDocentesInvestigacion(){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT DISTINCT (d.codigo),d.nombres,d.apellidos \n" +
                    "FROM general_docente as d join carga_carga_academica as c join carga_investigacion as g\n" +
                    "where g.id_carga=c.id and c.codig_doc=d.codigo order by d.apellidos");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+=",";
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
        if(total==""){total="No hay Docentes-en Investigación,";}
        return total;
    }
    
      public String consultarDocentesDocencia(){
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    "SELECT DISTINCT (d.codigo),d.nombres,d.apellidos \n" +
                    "FROM general_docente as d join carga_carga_academica as c join carga_grupo as g\n" +
                    "where g.id_carga=c.id and c.codig_doc=d.codigo order by d.apellidos");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+=",";
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
        if(total==""){total="No hay Docentes-en Docencia,";}
        return total;
    }
    
      public String consultarDocentes() {
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("Select codigo,nombres,apellidos from general_docente order by apellidos");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="-"+resultado.getString(2);
                total+=" "+resultado.getString(3);
                total+=",";
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
        if(total==""){total="No hay-Docentes,";}
        return total;
    }
    
    
    public String habilitarSistema(String codigo,String ano,String periodo,String fechaCierre){
     
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            String insql="";
            int can=0;
            if(codigo=="*"){
               
                String todos[]=this.consultarDocentes().split(",");
                for(int i=0;i<todos.length;i++){
                   String code[]=todos[i].split("-");
                   insql="insert into carga_carga_academica(id,codig_doc,ano,periodo,fechacierre) values(null,'"+code[0]+"','"+ano+"','"+periodo+"','"+fechaCierre+"')";
                   stm = con.prepareStatement(insql);//genero el sql. 
                   can = stm.executeUpdate();//ejecuto la consulta 
                }
                stm = con.prepareStatement("update general_docente set estado=1");//genero el sql. 
                can = stm.executeUpdate();//ejecuto la consulta 
                can=1;
            }
            else{
                  String todos[]=codigo.split("-");
                  for(int i=0;i<todos.length;i++){
                    String code=todos[i].toString();
                    insql="insert into carga_carga_academica(id,codig_doc,ano,periodo,fechacierre) values(null,'"+code+"','"+ano+"','"+periodo+"','"+fechaCierre+"')";
                    stm = con.prepareStatement(insql);//genero el sql. 
                    can = stm.executeUpdate();//ejecuto la consulta 
                    stm = con.prepareStatement("update general_docente set estado=1 where codigo= "+code);//genero el sql. 
                    can = stm.executeUpdate();//ejecuto la consulta 
                    can=1;
                  }
            }
            stm.close();//cierro el preparedstatement
            
            if(can == 1){
                System.out.println(" Se Habilitó el Sistema");
                return "Exito: Se Habilitó el Sistema";
            }else{
                 System.out.println("NO Se Habilitó el Sistema");
                return "NO Se Habilitó el Sistemaa";
            }
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("Error NO");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("Help, no registro");
                System.err.println(ex);
            }
        }   
        return null;
    }

    public String darProrroga(String codigo, String fechaCierre) {
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
       
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            
            String insql="";
            int can=0;
            if(codigo=="*"){
                
                ResultSet resultado=null;
                stm = con.prepareStatement("Select codig_doc from carga_carga_academica");//genero el sql. 
                resultado= stm.executeQuery();//ejecuto la consulta
                String total="";
                
                while(resultado.next()){
                    total+=resultado.getString(1);
                    total+="-";
                }

                String todos[]=total.split("-");
                for(int i=0;i<todos.length;i++){
                   
                   insql="update carga_carga_academica set fechaCierre='"+fechaCierre+"'";
                   stm = con.prepareStatement(insql);//genero el sql. 
                   can = stm.executeUpdate();//ejecuto la consulta 
                   
                   insql="update general_docente set estado=1 where codigo= "+todos[i];
                   stm = con.prepareStatement(insql);//genero el sql. 
                   can = stm.executeUpdate();//ejecuto la consulta 
                }
                can=1;
            }
            else{
                  String todos[]=codigo.split("-");
                  for(int i=0;i<todos.length;i++){
                    
                    insql="update carga_carga_academica set fechaCierre='"+fechaCierre+"' where codig_doc= "+todos[i];
                    stm = con.prepareStatement(insql);//genero el sql. 
                    can = stm.executeUpdate();//ejecuto la consulta 
                    
                    insql="update general_docente set estado=1 where codigo= "+todos[i];
                    stm = con.prepareStatement(insql);//genero el sql. 
                    can = stm.executeUpdate();//ejecuto la consulta 
                    can=1;
                  }
            }
            stm.close();//cierro el preparedstatement
            
            if(can == 1){
                System.out.println("Dió Prorroga para Ingresar al Sistema");
                return "Exito: Dió Prorroga para Ingresar al Sistema";
            }else{
                 System.out.println("NO Dió Prorroga a Sistema");
                return "NO Dió Prorroga a Sistema";
            }
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("Error NO");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("Help, no registro");
                System.err.println(ex);
            }
        }   
        return null;
    }

    public String actualizarInfoPersonal(String codigo, String cedula, String nombres, String apellidos,
    String estado, String nivel_estudio, String categoria, String tipo_vinculacion, String correo_institucional,
    String correo_personal, String titulo_pregrado, String celular, String anos_exp, String fecha_nac, String direccion_resi) {
    
    Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {
            
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
            "UPDATE general_docente SET cedula='"+cedula+"', nombres='"+nombres+"',apellidos='"+apellidos+"',estado="+estado+",nivel_estudio='"+nivel_estudio+
            "',categoria='"+categoria+"',tipo_vinculacion='"+tipo_vinculacion+"',correo_institucional='"+correo_institucional+"',correo_personal='"+correo_personal+
            "',titulo_pregrado='"+titulo_pregrado+"',celular='"+celular+"',anos_exp="+anos_exp+",fecha_nac='"+fecha_nac+"',direccion_resi='"+direccion_resi+
            "' WHERE codigo='"+codigo+"'");//genero el sql. 
                 
            int can = stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement
            
            if(can == 1){
                System.out.println("Exito: actualizó la información Personal del docente");
                return "Exito: actualizó infoPersonal";
            }else{
                 System.out.println("no actualizó infoPersonal");
                return "No actualizó infoPersonal";
            }
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no actualizó infoPersonal Docente");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("asdasd no actualizar");
                System.err.println(ex);
            }
        }   
        return null;
    }
   
    public String consultarinfoDocente(String codigo){
     
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultado=null;
        String total="";
        try {
            pool.setUsuario("root"); //ingreso el usuario
            pool.setContrasena("");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement(
                    
            "SELECT cedula,nombres,apellidos,correo_institucional,correo_personal,titulo_pregrado,celular,anos_exp,fecha_nac,direccion_resi from general_docente where codigo='"+codigo+"'");//genero el sql. 
            resultado= stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                total+=resultado.getString(1);
                total+="/"+resultado.getString(2);
                total+="/"+resultado.getString(3);
                total+="/"+resultado.getString(4);
                total+="/"+resultado.getString(5);
                total+="/"+resultado.getString(6);
                total+="/"+resultado.getString(7);
                total+="/"+resultado.getString(8);
                total+="/"+resultado.getString(9);
                total+="/"+resultado.getString(10);
                total+=",";
            }
            stm.close();//cierro el preparedstatement
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no Consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("asdasd no consulta");
                System.err.println(ex);
            }
        } 
       
        if(total==""){total="0/x/x/x/x/x/0/0/x/x,";}
        return total;
    }
}
