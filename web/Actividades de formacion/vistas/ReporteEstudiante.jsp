<jsp:useBean id="modact" scope="page" class="ActividadesFormacion.Facade.FacActividad" />
<jsp:useBean id="asis" scope="page" class="ActividadesFormacion.DTO.EstudianteDTO" />
<jsp:setProperty name="asis" property="codigo"  />

<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%=modact.TablaEstudiante(asis) %></strong>
</div>
</div>



