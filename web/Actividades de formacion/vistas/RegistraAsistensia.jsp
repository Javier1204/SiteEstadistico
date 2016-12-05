<jsp:useBean id="facade" scope="page" class="ActividadesFormacion.Facade.FacActividad" />
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>

<%--
  response.setContentType("text/html;charset=UTF-8");                   
                InputStream inputStream = null;

        
                
                int codigoActividad=Integer.parseInt(request.getParameter("codigoActividad"));
                int codigoEstudiante=Integer.parseInt(request.getParameter("codigoEstudiante"));
                Part filePart = request.getPart("file_uploaded");
                
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
                long size=filePart.getSize();
--%>

<%
    
    
              


%>



<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%= facade.registrarAsistencia3(request) %></strong>
</div>
</div>

