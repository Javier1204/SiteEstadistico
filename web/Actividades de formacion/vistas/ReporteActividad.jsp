<jsp:useBean id="modact" scope="page" class="ActividadesFormacion.Facade.FacActividad" />
<jsp:useBean id="activi" scope="page" class="ActividadesFormacion.DTO.ActividadDTO" />
<jsp:setProperty name="activi" property="codigo"  />
<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%=modact.Tablaactividades(activi) %></strong>
</div>
</div>

