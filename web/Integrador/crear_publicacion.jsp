<%-- 
    Document   : crear_publicacion
    Created on : 19-nov-2016, 20:07:38
    Author     : carlos
--%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%
    System.out.println("hola");
  List<ModuloDTO> modulos= ( List<ModuloDTO>) request.getAttribute("modulos");
%>  
<div class="contenidopopup">
    <center><h2>Crear publicacion</h2></center>
    <center><table>
            <form>
            <tr>
                <td><label>Titulo</label></td><td><input id="titulo"  class="ufps-input ufps-black" type="text" /></td>
            </tr>
            <tr>
                <td><label>Adjuntar informe</label></td>
                <td><select  class="ufps-input ufps-black" id="informe">
                         <option>No seleccion</option>
                         <% for(ModuloDTO mod : modulos){ %>
                         <option><%= mod.getNombre()%></option>
              
                <% } %>
                       
                        

                    </select>
                </td>
            </tr>
            <tr >
                <td valign="top"><label>Contenio</label></td>
                <td><textarea id="contenido"  class="ufps-input ufps-black" style="width: 400px; height: 300px;"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><center><button class="ufps-btn ufps-btn-light">Publicar</button></center></td>
            </tr>
            </form>
        </table>
    </center>
</div>

