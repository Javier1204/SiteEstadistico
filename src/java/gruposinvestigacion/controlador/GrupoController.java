/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.controlador;

import gruposinvestigacion.fachada.AdminFachade;
import gruposinvestigacion.fachada.Fachade;
import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import gruposinvestigacion.util.JsonUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class GrupoController extends HttpServlet {

    private AdminFachade aF;
    private Fachade f;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GrupoController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GrupoController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("accion") != null && request.getParameter("accion").equals("0")) {
            listarGrupos(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("1")) {
            registrarGrupo(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void registrarGrupo(HttpServletRequest request, HttpServletResponse response) {

        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("adminFachade") != null) {
                
                aF = (AdminFachade)request.getSession().getAttribute("adminFachade");
                String codigoColciencias = request.getParameter("codigoColciencias");
                String nombre = request.getParameter("nombre");
                String sigla = request.getParameter("sigla");
                String codigoDirector = request.getParameter("director");
                String contrasena = request.getParameter("contrasena");
                String correo = request.getParameter("correo");
                String ubicacion = request.getParameter("ubicacion");
                int anioCreacion = Integer.parseInt(request.getParameter("anioCreacion"));
                String telefono = request.getParameter("telefono");
                Date fechaCreacion = new Date(anioCreacion, 1, 1);
                InvestigacionIntegrante<GeneralDocente> director = new InvestigacionIntegrante<GeneralDocente>();
                director.setCodigo(codigoDirector);
                director.setContrasena(contrasena);
                InvestigacionGrupo grupo = new InvestigacionGrupo(codigoColciencias, null, nombre, sigla, 
                        director, correo, fechaCreacion, ubicacion, telefono);
                
                try {
                    aF.registrarGrupo(grupo);
                    out.print("Grupo Registrado");
                } catch (Exception ex) {
                    out.print("No se pudo registrar el Grupo. Error "+ex.getMessage());
                }
                
            } else {
                out.print("Acceso Restringido");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void listarGrupos(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("adminFachade") != null) {
                
                aF = (AdminFachade)request.getSession().getAttribute("adminFachade");

                try {
                    out.print(JsonUtil.arrayToString(aF.listarGrupos()));
                } catch (Exception ex) {
                    out.print("No se pudo registrar el Grupo. Error "+ex.getMessage());
                }
                
            } else {
                out.print("Acceso Restringido");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

}
