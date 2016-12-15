/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufps.negocio;

/**
 *
 * @author luxx
 */
import java.util.List;
import ufps.dao.*;
import ufps.dto.*;

public class ModuloEstudianteNego {
    
    
    public String registrarDatapersonal(DatosPersonales_DTO datap) {
        String msn = "";
       
        
            boolean consulta = DatosPersonales_DAO.agregarDataPersonal(datap);
            if (consulta) {
                msn = "registro exitoso";
            }
            else {
            msn = " Error datos personales";
             }
        return msn;
    }
    public String registrarDataacademica(DatosAcademicos_DTO datap) {
        String msn = "";
       
        
            boolean consulta = DatosAcademicos_DAO.agregarDataPersonal(datap);
            if (consulta) {
                msn = "registro exitoso";
            }
            else {
            msn = " Error datos academicos";
             }
        return msn;
    }
    
    public String EditarDataacademica(DatosAcademicos_DTO datap) {
        String msn = "";
        
      
       
            boolean consulta = DatosAcademicos_DAO.editarAcademito(datap);
            if (consulta) {
                msn = "DATOS ACADEMICOS ACTUALIZADOS";
            }
         else {
            msn = "ERROR AL ACTUALIZAR DATOS ACADEMICOS";
            }
        return msn;
    }
    public String EditarDataPersonal(DatosPersonales_DTO datap) {
        String msn = "";
        
      
       
            boolean consulta = DatosPersonales_DAO.editarPersonal(datap);
            if (consulta) {
                msn = "DATOS PERSONALES ACTUALIZADOS";
            }
         else {
            msn = "ERROR AL ACTUALIZAR DATOS PERSONALES";
            }
        return msn;
        
    }
    
    
    
    
    public String ConsultaAvanzada(int poredad,int edad1,int edad2,int porgene,int genero,int porcivi,int estado_civil,int porlec,int lectura,int porcienc,int naturales,int porsoci,int sociales,int poring,int ingles) {
        String msn = "";
        
//       SELECT `id`, `id_estudiante`, `nombre`, `apellido`, `tipo_documento`, `documento`, `fecha_nacimiento`, `pais`, `departamento`, `municipio`, `genero`, `edad`, `estado_civil` FROM `datospersonales`  as per
//
//left join `datosacademicos` as  aca on (`datosacademicos`.`id_estudiante`=`datospersonales`.`id_estudiante`)
//
//WHERE per.`edad`>=edad1 AND per.`edad`<=edad2 AND per.`genero`=genero AND per.`estado_civil`=estadocivil  
//And aca.lectura=lectura AND aca.naturales=naturales AND aca.sociales=sociales AND aca.ingles=ingles


        String consulta=" SELECT per.`nombre`, per.`apellido`, per.`genero`, per.`edad`, per.`estado_civil`  ";
        boolean per=false;
        if( (poredad ==1) || porgene==1 || porcivi==1 ){
            per=true;
           
        }
        boolean aca=false;
        if( (porlec ==1) || porcienc==1 || porsoci==1 || poring==1  ){
            aca=true;         
        }
        
        
        if ( aca==true || ( per ==true && aca == true) ){
         consulta+=" FROM `datospersonales`  as per left join `datosacademicos` as  aca on (`aca`.`id_estudiante`= per.`id_estudiante`) WHERE true";
        }
        else {

             consulta+=" FROM `datospersonales`  as per WHERE true";
        
        }
        
        
        if (poredad==1){
             consulta+=" AND per.`edad`>="+edad1+" AND per.`edad`<="+edad2+" and true  ";           
        }
        
        if (porgene==1){
             consulta+=" AND per.`genero`="+genero+" and true   ";           
        }
        
        if (porcivi==1){
             consulta+=" AND per.`estado_civil`="+estado_civil+"  and true  ";           
        }
        
        if (porlec==1){
             consulta+=" AND aca.lectura="+lectura+" and true  ";           
        }
        
        if (porsoci==1){
             consulta+=" AND aca.sociales="+sociales+" and true  ";           
        }
        
        if (porcienc==1){
             consulta+=" AND aca.naturales="+naturales+" and true  ";           
        }
        
        if (poring==1){
             consulta+=" AND aca.ingles="+ingles+" and true  ";           
        }
        
           System.out.println(consulta);
        
        String panel = "<div class='table-responsive' >"
                + " <div class=\"panel panel-danger\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Estudiante </h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th> Nomre </th>\n"
                + "                <th>Apellido </th>\n"
                + "                <th>Promedio </th>\n"
                + "<th>Edad </th>\n"
                + ""
                + "            </tr> </thead>";
       
        

        
        
        List<DatosPersonales_DTO> datos = DatosAcademicos_DAO.avanzada(consulta);
        int i = 0;
        
        int cant=UsuarioDAO.cantUsers();
       
        tabla += "<tbody>";
        for (DatosPersonales_DTO dat : datos) {
            tabla += " <tr>\n"
                    + "                <td>"+dat.getNombre() + "</td>\n"
                    + "                <td  >" + dat.getApellido() + "</td>\n"
                    + "                <td  >" + dat.getEdad() + "</td>\n"                              
                    + "            </tr> ";
            i++;
          
        }
          float por=(i*100)/cant;
        tabla += " <tr>\n"
                + "                <td></td>\n"
                    + "                <td  >Porcentaje Total</td>\n"
                    + "                <td  >" + por + "%</td>\n"                              
                    + "            </tr> ";
       
        tabla += "</tbody>";
        return tabla + "</table> </div> </div>"
                + ""
                 + ""
               + "<script type=\"text/javascript\">"
                + " $('#listadotabla').DataTable( {" +
"        dom: 'Bfrtip'," +
"        buttons: [" +
"            'excel', 'pdf'" +
"        ]" +
"    } );"
                + "</script>";
        
          
        
    }
    
    
     public String registrarUsuario(UsuarioDTO usuario) {
        String msn = "";
        
     
        UsuarioDTO usu = UsuarioDAO.buscarUsuario(usuario);
        if (usu == null) {
            boolean consulta = UsuarioDAO.agregarUsuario(usuario);
            if (consulta) {
                msn = "Usuario  se ha registrado exitosamente";
            }else{
                msn="Usuario no se puedo registrar";
            }
        } else {
            msn = " Usuario  ya se Encuentra registrado";
        }
        return msn;
       }
        public String ValidarUsuario(UsuarioDTO usuario) {
        String msn = "";
        UsuarioDTO validarUsuario = UsuarioDAO.validarUsuario(usuario);
        if (validarUsuario != null) {
            msn = validarUsuario.getCodigo() + "," + validarUsuario.getNombre()+","+validarUsuario.getTipo();
        }
        return msn;
    }
        
        
        
        public String buscarAcademica(UsuarioDTO usuario) {
         String msn = "";
        DatosAcademicos_DTO usu = DatosAcademicos_DAO.buscarUsuario(usuario);
        System.out.println(""+usu.getId_estudiante() + "," + usu.getColegio_grado() + "," + usu.getEspecialidad() + "," + usu.getAno_grado()+ "," + usu.getValida()+ "," + usu.getIdioma()+ "," + usu.getDepartamento_grado()+ "," + usu.getMunicipio_grado()+ "," + usu.getIngreso()+ "," + usu.getLectura() + "," + usu.getNaturales()+ "," + usu.getSociales()+ "," + usu.getIngles());

        if (usu != null) {

            return msn = usu.getId_estudiante() + "," + usu.getColegio_grado() + "," + usu.getEspecialidad() + "," + usu.getAno_grado()+ "," + usu.getValida()+ "," + usu.getIdioma()+ "," + usu.getDepartamento_grado()+ "," + usu.getMunicipio_grado()+ "," + usu.getIngreso()+ "," + usu.getLectura() + "," + usu.getNaturales()+ "," + usu.getSociales()+ "," + usu.getIngles();
        }
        return msn;
     
                        

        
    }

        
        
        public String buscarPersonal(UsuarioDTO usuario) {
        String msn = "";
        DatosPersonales_DTO usu = DatosPersonales_DAO.buscarUsuario(usuario);
        if (usu != null) {
            return msn = usu.getNombre() + "," + usu.getApellido() + "," + usu.getTipo_documento() + "," + usu.getDocumento()+ "," + usu.getFecha_nacimiento()+ "," + usu.getPais()+ "," + usu.getDepartamento()+ "," + usu.getMunicipio()+ "," + usu.getGenero()+ "," + usu.getEdad() + "," + usu.getEstado_civil()+ "," + usu.getId_estudiante();
        }
        return msn;
    }

    
}
