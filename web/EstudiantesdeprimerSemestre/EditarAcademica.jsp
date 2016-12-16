<jsp:useBean id="modestu" scope="page" class="ufps.facade.ModuloEstudiante" />
<jsp:useBean id="academico" scope="page" class="ufps.dto.DatosAcademicos_DTO" />
<jsp:setProperty name="academico" property="id_estudiante"  />
<jsp:setProperty name="academico" property="colegio_grado"  />
<jsp:setProperty name="academico" property="especialidad" />
<jsp:setProperty name="academico" property="valida" /> 
<jsp:setProperty name="academico" property="idioma" /> 
<jsp:setProperty name="academico" property="ano_grado" /> 
<jsp:setProperty name="academico" property="departamento_grado" /> 
<jsp:setProperty name="academico" property="municipio_grado" /> 
<jsp:setProperty name="academico" property="ingreso" /> 
<jsp:setProperty name="academico" property="lectura" /> 
<jsp:setProperty name="academico" property="naturales" /> 
<jsp:setProperty name="academico" property="sociales" /> 
<jsp:setProperty name="academico" property="ingles" /> 
<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
 
  <strong><%=modestu.EditarDataacademica(academico) %></strong>
  
</div>
</div>