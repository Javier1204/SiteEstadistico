<jsp:useBean id="modestu" scope="page" class="ufps.facade.ModuloEstudiante" />
<jsp:useBean id="usuario" scope="page" class="ufps.dto.UsuarioDTO" />
<jsp:setProperty name="usuario" property="correo_electronico"  />
<jsp:setProperty name="usuario" property="nombre"  />
<jsp:setProperty name="usuario" property="contrasena" />
<jsp:setProperty name="usuario" property="codigo" /> 
<jsp:setProperty name="usuario" property="tipo" /> 
<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%=modestu.registrarUsuario(usuario) %></strong>
</div>
</div>