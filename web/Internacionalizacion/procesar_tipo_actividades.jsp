
<%@page import="Internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Internacionalizacion.Modelo.DTO.Tipo_actividades"%>
<%@page import="Internacionalizacion.Facade.Facade"%>




<%
    //request.setCharacterEncoding("UTF-8");
    String convenio = request.getParameter("convenio");

    
    System.out.println(convenio);
    Facade f = new Facade();
    
    Convenio c = f.consultarConvenio(convenio);
    
    String fechamin = c.getFechainicio();
    String fechamax = c.getFechaterminacion();
    
    
//Obtengo el convenio seleccionado.
    ArrayList<String> actividades = f.obtenerActividades(convenio);
    
  actividades.add(fechamin);
  actividades.add(fechamax);
    
    
    
    for(String x: actividades)
        System.out.println(x);
    Gson gson = new Gson();
    ArrayList<String> vector= new ArrayList();

    String respuesta = gson.toJson(actividades);
    
    //System.out.println("jsp"+respuesta);
    //char[] arr = respuesta.toCharArray();
    
    //for(int i=0;i<arr.length;i++)
    /*String cadena ="";
        for(char x:arr){
             if((x=='[') || (x==']') || (x=='"') || (x==',')){
              
                 if(x==','){
                     vector.add(cadena);
                     cadena="";
                 }
             }
             
             else
                 cadena+=x;
        }
            vector.add(cadena);            
        //System.out.println(cadena);
        //for(String s:vector)
        //System.out.println(s);*/
    //System.out.print(respuesta);
    //out.print(respuesta);
    
    //System.out.println("respuesta->"+respuesta);
   
    response.getWriter().print(respuesta);
//out.print(respuesta);
%>
