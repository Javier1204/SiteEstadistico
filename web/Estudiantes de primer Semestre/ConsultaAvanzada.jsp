<jsp:useBean id="modestu" scope="page" class="ufps.facade.ModuloEstudiante" />


<%



    int  poredad =Integer.parseInt(request.getParameter("poredad"));
    int  edad1 =Integer.parseInt(request.getParameter("edad1"));
    int  edad2 =Integer.parseInt(request.getParameter("edad2"));
    
    int  porgene =Integer.parseInt(request.getParameter("porgene"));
    int  genero =Integer.parseInt(request.getParameter("genero"));
   
    
    int  porcivi =Integer.parseInt(request.getParameter("porcivi"));
    int  estado_civil =Integer.parseInt(request.getParameter("estado_civil"));
    

    int  porlec =Integer.parseInt(request.getParameter("porlec"));
    int  lectura =Integer.parseInt(request.getParameter("lectura"));
    
    
    int  porcienc =Integer.parseInt(request.getParameter("porcienc"));
    int  naturales =Integer.parseInt(request.getParameter("naturales"));
    
    
    int  porsoci =Integer.parseInt(request.getParameter("porsoci"));
    int  sociales =Integer.parseInt(request.getParameter("sociales"));
    
    int  poring =Integer.parseInt(request.getParameter("poring"));
    int  ingles =Integer.parseInt(request.getParameter("ingles"));
    



%>

<%=modestu.ConsultaAvanzada(poredad,edad1,edad2,porgene,genero,porcivi,estado_civil,porlec,lectura,porcienc,naturales,porsoci,sociales,poring,ingles) %>