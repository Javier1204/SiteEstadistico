
<%--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/--%>

<%@page import="CargaAcademica.Fachada.Fachada"%>

<%
    String codigo=request.getParameter("codigo");
    String cedula=request.getParameter("cedula");
    String nombres=request.getParameter("nombres");
    String apellidos=request.getParameter("apellidos");
    String estado=request.getParameter("estado");
    String nivel_estudio=request.getParameter("nivelEstudio");
    String categoria=request.getParameter("categoria");
    String tipo_vinculacion=request.getParameter("tipoVinculacion");
    String correo_institucional=request.getParameter("correoInstitucional");;
    String correo_personal=request.getParameter("correoPersonal");;
    String titulo_pregrado=request.getParameter("tituloPregrado");;
    String celular=request.getParameter("celular");;
    String anos_exp=request.getParameter("anoExperiencia");;
    String fecha_nac=request.getParameter("fechaNacimiento");;
    String direccion_resi=request.getParameter("direccionResidencia");;
    
    
    Fachada f=new Fachada();
    String msj=f.actualizarInfoPersonal(codigo,cedula,nombres,apellidos,estado,nivel_estudio,categoria,tipo_vinculacion,correo_institucional,correo_personal,titulo_pregrado,celular,anos_exp,fecha_nac,direccion_resi);
    request.getSession().setAttribute("respuesta_infoPersonal",msj);
    
%>

<%
response.sendRedirect("infoPersonal.jsp");
%>