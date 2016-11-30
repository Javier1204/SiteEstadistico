
<%--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/--%>

<%@page import="CargaAcademica.Fachada.Fachada"%>

<%

if(request.getParameter("nfin")==null){
    String codigo=request.getParameter("code");
    if(codigo==null||!codigo.contains("-")){codigo="*";}
    
    String ano=request.getParameter("ano");
    String periodo=request.getParameter("periodo");
    String fin=request.getParameter("fin");
    
    Fachada f=new Fachada();
    String msj=f.habilitarSistema(codigo, ano, periodo, fin);
    request.getSession().setAttribute("respuesta_habilito",msj);
}    
else{
   String codigo2=request.getParameter("code2");
   if(codigo2==null||!codigo2.contains("-")){codigo2="*";}
   String nfin=request.getParameter("nfin");
   
   Fachada f=new Fachada();
   String msj=f.darProrroga(codigo2,nfin);
   request.getSession().setAttribute("respuesta_prorroga",msj);
} 

%>

<%
response.sendRedirect("administrar.jsp");
%>