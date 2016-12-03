<%-- 
    Document   : registro_practica_p
    Created on : 22/11/2016, 01:58:34 PM
    Author     : Usuario
--%>
<%@page import="Practicas.DTO.practicaDTO"%>
<%@page import="Practicas.DTO.tutor_empresaDTO"%>
<%@page import="Practicas.Facade.Facade"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String ano_practica=null;
String semestre_practica=null;
String id_convenio=null;
String estado=null;
String id_estudiante=null;
String id_docente = null;
int id_perfil=0;
int id_tutor=0;

ano_practica=request.getParameter("ano_practica");
semestre_practica=request.getParameter("semestre_practica");
id_convenio=request.getParameter("id_convenio");
estado=request.getParameter("estado");
id_estudiante=request.getParameter("id_estudiante");
id_docente = request.getParameter("id_docente");

System.out.println("DATOS QUE ENVIA: " + ano_practica + " , "+semestre_practica +" , " + id_convenio+" , " + estado +" , "+ id_estudiante + " , "+ id_docente);

if(request.getParameter("id_perfil")!=null){
    id_perfil=Integer.parseInt(request.getParameter("id_perfil"));
}

if(request.getParameter("id_tutor")!=null){
    id_tutor=Integer.parseInt(request.getParameter("id_tutor"));
}
    
Facade f = new Facade();
practicaDTO p= new practicaDTO(ano_practica, semestre_practica, id_convenio, estado, id_docente, id_estudiante, id_perfil, id_tutor);
//p.setAño_practica(año_practica);
//p.setSemestre_practica(semestre_practica);
//p.setId_convenio(id_convenio);
//p.setEstado(estado);
//p.setId_estudiante(id_estudiante);
//p.setId_docente(id_docente);
//p.setId_perfil(id_perfil);
//p.setId_tutor(id_tutor);

String r = f.RegistrarPractica(p);//corralo
System.out.println(p.toString());
request.getSession().setAttribute("respuesta_registro_practica", r);
%>

    
<%
response.sendRedirect("registro_practica.jsp");

%>