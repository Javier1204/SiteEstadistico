<jsp:useBean id="modact" scope="page" class="ActividadesFormacion.Facade.FacActividad" />
<jsp:useBean id="asistencia" scope="page" class="ActividadesFormacion.DTO.AsistenciaDTO" />
<jsp:setProperty name="asistencia" property="codigoActividad"  />
<jsp:setProperty name="asistencia" property="codigoEstudiante"  />


<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%=modact.registrarAsistencia(asistencia) %></strong>
</div>
</div>

