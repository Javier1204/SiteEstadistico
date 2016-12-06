

<%@page import="Internacionalizacion.Modelo.DAO.DAOPasantia"%>
<%@page import="Internacionalizacion.Modelo.DTO.Pasantia"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="Internacionalizacion.Modelo.DTO.Actividad_Estudiante"%>
<%@page import="Internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="Internacionalizacion.Modelo.DAO.DAOConvenio"%>
<%@page import="Internacionalizacion.Modelo.DTO.Actividad"%>
<%@page import="Internacionalizacion.Facade.Facade"%>


<%
    request.setCharacterEncoding("UTF-8");    
    String convenio = request.getParameter("convenio");
    System.out.println("Codigo de convenio es: " + convenio);
    String nombre = request.getParameter("nombre");        
    short semestre = Short.parseShort(request.getParameter("semestre"));
    String hora = request.getParameter("hora");
    String responsable = request.getParameter("responsable");
    String tipoactividad = request.getParameter("tipoactividad");
    String lugar = request.getParameter("lugar");    
    String descripcion = request.getParameter("descripcion");        
    String inicio = request.getParameter("creacion");
    String[] fecha1 = inicio.split("-");
    String terminacion = request.getParameter("terminacion");
    String[] fecha2 = terminacion.split("-");
    
    String nombrepasantia = request.getParameter("nombrepasantia");
    String tutoru = request.getParameter("tutoru");
    String tutorempresa = request.getParameter("tutorempresa");
    
    
    Calendar calendar1 = new GregorianCalendar(Integer.parseInt(fecha1[0]), Integer.parseInt(fecha1[1]), Integer.parseInt(fecha1[2])); 
    Date f1 = new Date(calendar1.getTimeInMillis());
    Calendar calendar2 = new GregorianCalendar(Integer.parseInt(fecha2[0]), Integer.parseInt(fecha2[1]), Integer.parseInt(fecha2[2])); 
    Date f2 = new Date(calendar2.getTimeInMillis());
    
    long diferencia = ( f2.getTime() - f1.getTime() ) / (1000 * 60 * 60 * 24);
    int meses = (int) diferencia / 30;
    
    
    Facade f = new Facade();
    Actividad a = new Actividad();
    
    if(tipoactividad=="Pasantia"){
    Pasantia p = new Pasantia();
    p.setIdconvenio(convenio);
    p.setProyecto(nombrepasantia);
    p.setTutorempresa(tutorempresa);
    p.setTutoruniversidad(tutoru);
    
    DAOPasantia dao = new DAOPasantia();
    dao.RegistrarPasantia(p);
    }
    a.setNombre(nombre);
    a.setDescripcion(descripcion);
    a.setDuracion(meses+"");
    a.setIdconvenio(convenio);
    if (hora == null) {
        a.setHora("No aplica");
    } else {
        a.setHora(hora);
    }
    a.setLugar(lugar);
    a.setResponsable(responsable);
    a.setTipoactividad(tipoactividad);
    a.setFechacreacion(inicio);
    a.setFechaterminacion(terminacion);
    a.setSemestre(semestre);
    String registro = f.RegistrarActividad(a);

//Codigo para el registro de los estudiantes, se debe recorrer el array gracias a request parameter
//dado por el name del input y se debe enviar por POST los datos de los estudiantes???
//String [] estudiantes = request.getParameterValues("estudiante");
    Actividad_Estudiante act = null;
    String[] est = request.getParameterValues("estudiantes");
    Actividad actividad = f.consultarActividad_By_IDConvenio(convenio);
    System.out.println("El id de la actividad es: " + actividad.getId());
    int idactividad = actividad.getId();
    
    if(est!=null){
    for (String cod : est) {
        act = new Actividad_Estudiante();
        if(cod!=null){
        act.setCodigoestudiante(cod);        
        act.setIdactividad(idactividad);
        
        f.RegistrarActividad_Estudiante(act);
        }
    }
    }
    request.getSession().setAttribute("respuesta_actividad", registro);
    response.sendRedirect("registrarActividad.jsp");
    
%>

