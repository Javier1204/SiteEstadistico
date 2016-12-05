<jsp:useBean id="modact" scope="page" class="ActividadesFormacion.Facade.FacActividad" />
<jsp:useBean id="acti" scope="page" class="ActividadesFormacion.DTO.ActividadDTO" />
<jsp:setProperty name="acti" property="fechaInicio"  />
<jsp:setProperty name="acti" property="fechaFin"  />
<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%=modact.TablaSemestre(acti) %></strong>
</div>
</div>