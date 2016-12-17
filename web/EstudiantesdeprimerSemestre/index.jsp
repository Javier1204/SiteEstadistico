
<%@page import="gestionUsuarios.ICuenta"%>


<%



    ICuenta cuenta=(ICuenta) session.getAttribute("usuario");
    String cod=cuenta.getUser();
    boolean estu=cuenta.containRol("Estudiante");
    boolean docente=cuenta.containRol("Docente");
    
    
    System.out.println(cod);
    System.out.println(estu);
    System.out.println(docente);
    if(estu){
        response.sendRedirect("indexEstudiante.jsp");
    }
    if (docente){
         response.sendRedirect("indexAdmin.jsp");
    }
    







%>
















