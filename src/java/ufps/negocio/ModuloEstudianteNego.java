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
        
        if (porcienc==1){
             consulta+=" AND aca.naturales="+naturales+" and true  ";           
        }
        
        if (poring==1){
             consulta+=" AND aca.ingles="+ingles+" and true  ";           
        }
        
           System.out.println(consulta);
        
        String panel = "<div class='table-responsive' >"
                + " <div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Estudiante </h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th> Nomre </th>\n"
                + "                <th>Apellido </th>\n"
                + "<th>Edad </th>\n"
                + ""
                + "            </tr> </thead>";
       
        

        
        
        List<DatosPersonales_DTO> datos = DatosAcademicos_DAO.avanzada(consulta);
        int i = 0;
       
        tabla += "<body>";
        for (DatosPersonales_DTO dat : datos) {
            tabla += " <tr>\n"
                    + "                <td>"+dat.getNombre() + "</td>\n"
                    + "                <td  >" + dat.getApellido() + "</td>\n"
                    + "                <td  >" + dat.getEdad() + "</td>\n"                              
                    + "            </tr> ";
            i++;
          
        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>"
                + ""
                 + ""
               + "<script type=\"text/javascript\">"
                + " $('#listadotabla').DataTable( { " +
     
"    } );"
                + "</script>";
        
          
        
    }
    
    
    
    
}
