<jsp:useBean id="modestu" scope="page" class="ufps.facade.ModuloEstudiante" />
<jsp:useBean id="usuario" scope="page" class="ufps.dto.UsuarioDTO" />
<jsp:setProperty name="usuario" property="correo_electronico" />
<jsp:setProperty name="usuario" property="contrasena" />

<%   String  capi1 =modestu.validarUsuario(usuario);
if(!capi1.isEmpty()){
    String [] capi =capi1.split(",");
        if(capi.length!=0){
          session.setAttribute("usuario",true);
          session.setAttribute("nombre",capi[1]);
          session.setAttribute("codigo",capi[0]);
          String tipo = capi[2];
          System.err.println(tipo);
       if(tipo.equals("Estudiante")){
          response.sendRedirect("../EstudiantesdeprimerSemestre/indexEstudiante.jsp");
          
          }
          else{
           response.sendRedirect("../EstudiantesdeprimerSemestre/indexAdmin.jsp");
          }
        } else
        {
           
        }
}else{
 response.sendRedirect("../index.jsp");
}
        
     %>
