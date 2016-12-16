<jsp:useBean id="modact" scope="page" class="ActividadesFormacion.Facade.FacActividad" />
<jsp:useBean id="actividad" scope="page" class="ActividadesFormacion.DTO.ActividadDTO" />
<jsp:setProperty name="actividad" property="nombre"  />
<jsp:setProperty name="actividad" property="responsablePonente"  />
<jsp:setProperty name="actividad" property="convenio" />
<jsp:setProperty name="actividad" property="siconv" /> 
<jsp:setProperty name="actividad" property="tipoActividad" /> 
<jsp:setProperty name="actividad" property="fechaInicio" /> 
<jsp:setProperty name="actividad" property="fechaFin" /> 
<jsp:setProperty name="actividad" property="lugar" /> 
<jsp:setProperty name="actividad" property="organizador" /> 
<div class="text-center">
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong><%=modact.registrarActividad(actividad) %></strong>
</div>
</div>





