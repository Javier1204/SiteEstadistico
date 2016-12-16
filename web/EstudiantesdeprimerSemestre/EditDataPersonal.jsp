<jsp:useBean id="modestu" scope="page" class="ufps.facade.ModuloEstudiante" />
<jsp:useBean id="personal" scope="page" class="ufps.dto.DatosPersonales_DTO" />
<jsp:setProperty name="personal" property="id_estudiante"  />
<jsp:setProperty name="personal" property="nombre" />
<jsp:setProperty name="personal" property="apellido" /> 
<jsp:setProperty name="personal" property="tipo_documento" /> 
<jsp:setProperty name="personal" property="documento" /> 
<jsp:setProperty name="personal" property="fecha_nacimiento" /> 
<jsp:setProperty name="personal" property="pais" /> 
<jsp:setProperty name="personal" property="departamento" /> 
<jsp:setProperty name="personal" property="municipio" /> 
<jsp:setProperty name="personal" property="genero" /> 
<jsp:setProperty name="personal" property="edad" /> 
<jsp:setProperty name="personal" property="estado_civil" /> 
<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%=modestu.EditarDataPersonal(personal) %></strong>
</div>
</div>


