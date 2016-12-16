<jsp:useBean id="modact" scope="page" class="ActividadesFormacion.Facade.FacActividad" />
<jsp:useBean id="ponent" scope="page" class="ActividadesFormacion.DTO.PonenteDTO" />
<jsp:setProperty name="ponent" property="*"  />


<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%=modact.registrarPonente(ponent) %></strong>
</div>
</div>


