<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page import="Internacionalizacion.Modelo.DTO.Docente"%>
<%@page import="java.util.ArrayList"%>

<%

    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    if (cuenta == null) {

        response.sendRedirect("../Integrador/login.jsp");

    } 
    //else if (cuenta.getUser().equals("8")) {

        //String codigo = cuenta.getUser();
        //if(codigo=="8"){
        //System.out.println("soy el 8");
//%>
<!--<script type="text/javascript">
    alert("ERES COORDINADOR NO PUEDES ENTRAR AQUÍ!");
</script>-->
<%
//response.sendRedirect("index.jsp");
//}
String codigo="";
Facade fachada = new Facade();
Docente d = null;
if(cuenta != null){
codigo = cuenta.getUser();

d = fachada.consultarDocente(codigo);
if(!d.isHabilitado()){
        
%>
<script type="text/javascript">
    
    alert("NO ESTÁ HABILITADO POR EL COORDINADOR!");
</script>
<%
    response.sendRedirect("index.jsp");
}
}

    

    
    
if (request.getSession().getAttribute("respuesta_actividad") != null) {

%>
<%}
    request.getSession().setAttribute("respuesta_actividad", null);
%>

<center>
    <fieldset>
                <!-- Form Name -->
                <legend><center><strong><h1>Formulario para HabilitarDocente</h1></strong></center></legend>
            </fieldset>

<div class="col-md-12">
    <center>
    <form action="habilitarDocente_pro.jsp" method="POST">
        
        <div class="ufps-col-tablet-8 ufps-col-tablet-offset-2">
            <label for="responsable" title="Docente responsable">Docente para habilitar: <span class="glyphicon glyphicon-question-sign"></span></label>
            
            <select class="ufps-input" id="docente" name="responsable">
                <%                                            ArrayList<Docente> docentes = fachada.obtenerDocentes();
                    for (Docente docente : docentes) {

                %>
                <option value="<%=docente.getCodigo()%>"><%=docente.getNombres()%></option>

                <%}
                %>

            </select>
                <input type="radio" name="radio" value="habilitar" checked="">Habilitar
                <input type="radio" name="radio" value="Deshabilitar">Deshabilitar
            <div class="form-group col-md-12">
                <button type="submit" class="ufps-btn">Habilitar</button>
            </div>
        </div>
    </form>
                </center>
</div>
                </center>
               