/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.Controlador;

/**
 *
 * @author luxx
 */
import ActividadesFormacion.DAO.ActividadDAO;
import ActividadesFormacion.DAO.AsistenciaDAO;
import ActividadesFormacion.DAO.PonenteDAO;
import ActividadesFormacion.DTO.ActividadDTO;
import ActividadesFormacion.DTO.AsistenciaDTO;
import ActividadesFormacion.DTO.ConvenioDTO;
import ActividadesFormacion.DTO.PonenteDTO;
import ActividadesFormacion.DTO.EstudianteDTO;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import ufps.negocio.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.dao.*;
import ufps.dto.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ModuloActividades {
    
    
    public String registrarActividad(ActividadDTO datap)  {
        String msn = "error";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd hh:mm");
        
        try {
            Date ini =  df.parse(datap.getFechaInicio());
            Date fin=   df.parse(datap.getFechaFin());
            if((fin.compareTo(ini))<=0){
             msn = "fecha erronea";
             return msn;
        }
       
            boolean consulta = ActividadDAO.registrarActividad(datap);
            if (consulta) {
                msn = "registro exitoso";
            }
            else {
            msn = " Error datos Actividad";
             }
        return msn;
        } catch (ParseException ex) {
            Logger.getLogger(ModuloActividades.class.getName()).log(Level.SEVERE, null, ex);
             return msn;
        }
        
        
    }
//    public String registrarAsistencia(AsistenciaDTO datap) {
//        String msn = "";
//       
//        
//            boolean consulta = AsistenciaDAO.registrarAsistencia(datap);
//            if (consulta) {
//                msn = "registro exitoso";
//            }
//            else {
//            msn = " Error datos academicos";
//             }
//        return msn;
//    }
    public String registrarPonente(PonenteDTO datap) {
        String msn = "";
       
        System.out.println(datap.toString());
        
            boolean consulta = PonenteDAO.registrarPonente(datap);
            if (consulta) {
                msn = "registro exitoso";
            }
            else {
            msn = " Error datos ponente";
             }
        return msn;
    }
    
    
     public String ListarActividades() {
    
        String list = "<select class=\"form-control\" id='codigo'>";
        List<ActividadDTO> listadoFecha = ActividadDAO.ListadoActividad();
        for (ActividadDTO acti:listadoFecha ) {
            list += "<option value=\'" +acti.getCodigo() +"\'>" + acti.getNombre() + "</option>";
        }
        return list + "</select>";
    
    }
     public String ListarActividades2() {
    
        String list = "<select class=\"form-control\" id='codigoActividad'>";
        List<ActividadDTO> listadoFecha = ActividadDAO.ListadoActividad();
        for (ActividadDTO acti:listadoFecha ) {
            list += "<option value=\'" +acti.getCodigo() +"\'>" + acti.getNombre() + "</option>";
        }
        return list + "</select>";
    
    }
    
     public String ListarConvenios() {
    
        String list = "<select class=\"form-control\" id='convenio'>";
        List<ConvenioDTO> listadoFecha = ActividadDAO.ListadoConvenio();
        for (ConvenioDTO conv:listadoFecha ) {
            list += "<option value=\'" +conv.getId() +"\'>" + conv.getNombre() + "</option>";
        }
        return list + "</select>";
    
    }
    
     public String ListarPonentes() {
    
        String list = "<select class=\"form-control\" id='responsablePonente'>";
        List<PonenteDTO> listadoFecha = PonenteDAO.ListadoPonente();
        for (PonenteDTO pon:listadoFecha ) {
            list += "<option value=\'" +pon.getCodigo()+"\'>" + pon.getNombre() + "</option>";
        }
        return list + "</select>";
    
    }
     
     
     public String ListarEstudiantes() {
    
        String list = "<select class=\"form-control\" id='codigo'>";
        List<EstudianteDTO> listadoFecha = ActividadDAO.ListadoEstudiante();
        for (EstudianteDTO estu:listadoFecha ) {
            list += "<option value=\'" +estu.getCodigo()+"\'>" + estu.getNombre() + "</option>";
        }
        return list + "</select>";
    
    }
     public String ListarEstudiantes2() {
    
        String list = "<select class=\"form-control\" id='codigoEstudiante'>";
        List<EstudianteDTO> listadoFecha = ActividadDAO.ListadoEstudiante();
        for (EstudianteDTO estu:listadoFecha ) {
            list += "<option value=\'" +estu.getCodigo()+"\'>" + estu.getNombre() + "</option>";
        }
        return list + "</select>";
    
    }
     
     
     
    
    public String Tablaactividades(ActividadDTO acti) {
        String panel = " <div class='table-responsive' >"
                + " <div class=\"panel panel-danger\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Actividad  </h3></div>";
        String tabla = panel + "<table  id=\"activiaddes\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
//                + "                <th>No</th>\n"
                + "                <th>Nombre</th>\n"
                + "                <th>Ponente</th>\n"
                + "                <th>Convenio </th>\n"
                + "                <th>tipo actividad </th>\n"
                + "                <th>fecha ini </th>\n"
                + "                <th>fecha fin </th>\n"
                + "                <th>lugar </th>\n"
                + "                <th>organizador </th>\n"
                + "                <th>Participantes </th>\n"
                + "            </tr> </thead>";
        List<ActividadDTO> poidon = ActividadDAO.BuscarActividad(acti);
        tabla += "<body>";
        int i = 1;
        
        
        for (ActividadDTO act : poidon) {
            
            List<EstudianteDTO> estus=ActividadDAO.BuscarParticipantes(acti);
            String participantes="";
            for (EstudianteDTO es : estus) {
                participantes+=" "+es.getNombre();
            }
            tabla += " <tr>\n"
//                    + "                <td >" + i + "</td>\n"
                    + "                <td   >" + act.getNombre() + "</td>\n"
                    + "                <td   >" + act.getNomresponsablePonente() + "</td>\n"
                    + "                <td   >" + act.getNomconvenio()+ "</td>\n"
                    + "                <td   >" + act.getTipoActividad()+ "</td>\n"
                    + "                <td   >" + act.getFechaInicio()+ "</td>\n"
                    + "                <td   >" + act.getFechaFin()+ "</td>\n"
                    + "                <td   >" + act.getLugar()+ "</td>\n"
                    + "                <td   >" + act.getOrganizador()+ "</td>\n"
                    + "                <td   >" + participantes+ "</td>\n"
                    + "            </tr> ";
            i++;

        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>"
                 + ""
               + "<script type=\"text/javascript\">"
                + " $('#activiaddes').DataTable( {\n" +
"        dom: 'Bfrtip',\n" +
"        buttons: [\n" +
"            'excel', 'pdf'\n" +
"        ]\n" +
"    } );"
                + "</script>";
    }
    
     public String TablaSemestre(ActividadDTO acti) {
        String panel = " <div class='table-responsive' >"
                + " <div class=\"panel panel-danger\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>ACTIVIDADES SEMESTRE </h3></div>";
        String tabla = panel + "<table  id=\"semestre\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
//                + "                <th>No</th>\n"
                + "                <th>Nombre</th>\n"
                + "                <th>Ponente</th>\n"
                + "                <th>Convenio </th>\n"
                + "                <th>tipo actividad </th>\n"
                + "                <th>fecha ini </th>\n"
                + "                <th>fecha fin </th>\n"
                + "                <th>lugar </th>\n"
                + "                <th>organizador </th>\n"
                + "            </tr> </thead>";
        List<ActividadDTO> poidon = ActividadDAO.BuscarActividadSemestre(acti);
        tabla += "<body>";
        int i = 1;
        for (ActividadDTO act : poidon) {
            tabla += " <tr>\n"
//                   + "                <td >" + i + "</td>\n"
                    + "                <td   >" + act.getNombre() + "</td>\n"
                    + "                <td   >" + act.getNomresponsablePonente() + "</td>\n"
                    + "                <td   >" + act.getNomconvenio()+ "</td>\n"
                    + "                <td   >" + act.getTipoActividad()+ "</td>\n"
                    + "                <td   >" + act.getFechaInicio()+ "</td>\n"
                    + "                <td   >" + act.getFechaFin()+ "</td>\n"
                    + "                <td   >" + act.getLugar()+ "</td>\n"
                    + "                <td   >" + act.getOrganizador()+ "</td>\n"
                    + "            </tr> ";
            i++;

        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>"
                  + ""
                + "<script type=\"text/javascript\">"
                + " $('#semestre').DataTable( {\n" +
"        dom: 'Bfrtip',\n" +
"        buttons: [\n" +
"             'excel', 'pdf'\n" +
"        ]\n" +
"    } );"
                + "</script>";
    }
    
      public String TablaEstudiante(EstudianteDTO est) {
        String panel = " <div class='table-responsive' >"
                + " <div class=\"panel panel-danger\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>ACTIVIDADES ESTUDIANTE </h3></div>";
        String tabla = panel + "<table  id=\"estudiante\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
//                + "                <th>No</th>\n"
                + "                <th>Nombre</th>\n"
                + "                <th>Ponente</th>\n"           
                + "                <th>Convenio </th>\n"
                + "                <th>tipo actividad </th>\n"
                + "                <th>fecha ini </th>\n"
                + "                <th>fecha fin </th>\n"
                + "                <th>lugar </th>\n"
                + "                <th>organizador </th>\n"
                + "            </tr> </thead>";
        List<ActividadDTO> poidon = ActividadDAO.BuscarActividadEstu(est);
        tabla += "<body>";
        int i = 1;
        for (ActividadDTO act : poidon) {
            tabla += " <tr>\n"
//                    + "                <td >" + i + "</td>\n"
                    + "                <td   >" + act.getNombre() + "</td>\n"
                    + "                <td   >" + act.getNomresponsablePonente() + "</td>\n"
                    + "                <td   >" + act.getNomconvenio()+ "</td>\n"
                    + "                <td   >" + act.getTipoActividad()+ "</td>\n"
                    + "                <td   >" + act.getFechaInicio()+ "</td>\n"
                    + "                <td   >" + act.getFechaFin()+ "</td>\n"
                    + "                <td   >" + act.getLugar()+ "</td>\n"
                    + "                <td   >" + act.getOrganizador()+ "</td>\n"
                   
                    + "            </tr> ";
            i++;

        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>"
                + ""
                + "<script type=\"text/javascript\">"
                + " $('#estudiante').DataTable( {\n" +
"        dom: 'Bfrtip',\n" +
"        buttons: [\n" +
"            'excel', 'pdf'\n" +
"        ]\n" +
"    } );"
                + "</script>";
    }

    public String registrarAsistencia2(int codigoActividad,int codigoEstudiante, InputStream inputStream,long size) {
        
       
        try {
            String msn = "";
            
            
            boolean consulta = AsistenciaDAO.actividad(codigoActividad,codigoEstudiante,inputStream,size);
            if (consulta) {
                msn = "registro exitoso";
            }
            else {
                msn = " Error datos academicos";
            }
            return msn;
        } catch (ServletException ex) {
            Logger.getLogger(ModuloActividades.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ModuloActividades.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       return "error";
    }
    
    public String registrarAsistencia3(HttpServletRequest request) {
        
       
        try {
            String msn = "";
            
            
            boolean consulta = AsistenciaDAO.actividad2(request);
            if (consulta) {
                msn = "registro exitoso";
            }
            else {
                msn = " Error datos academicos";
            }
            return msn;
        } catch (ServletException ex) {
            Logger.getLogger(ModuloActividades.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ModuloActividades.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       return "error";
    }

   
  
    
}
