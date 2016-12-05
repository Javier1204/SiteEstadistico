/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.controlador;

import gruposinvestigacion.fachada.AdminFachade;
import gruposinvestigacion.fachada.Fachade;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import java.io.IOException;
import java.io.PrintWriter;
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
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (request.getParameter("codigo") != null && request.getParameter("contrasena") != null) {

            String codigo = request.getParameter("codigo");
            String contrasena = request.getParameter("contrasena");

            if (codigo.equals("23")) {
                try {
                    AdminFachade f = new AdminFachade();
                    boolean exito = f.login(codigo, contrasena);

                    if (exito) {
                        request.getSession().setAttribute("adminFachade", f);
                        out.print("admin");
                        //response.sendRedirect("admin/perfil.jsp");
                    } else {
                        out.print("Datos Erróneos");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.print("Error: " + ex.getMessage());
                }
            } else {
                try {
                    Fachade f = new Fachade();
                    InvestigacionIntegrante integrante = f.login(codigo, contrasena);

                    if (integrante != null) {
                        request.getSession().setAttribute("fachada", f);
                        request.getSession().setAttribute("grupo", f.getGrupo(integrante.getGrupoCodigoColciencias()));
                        switch (integrante.getTipo()) {
                            case 1:
                                out.print("docente");
//                                response.sendRedirect("docente/perfil.jsp");
                                break;
                            case 2:
                                out.print("estudiante");
                                //response.sendRedirect("estudiante/perfil.jsp");
                                break;
                            case 3:
                                out.print("director");
                                //response.sendRedirect("director/perfil.jsp");
                                break;
                            default:
                                break;
                        }
                    } else {
                        out.print("Datos Erróneos");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.print("Error: " + ex.getMessage());
                }
            }
        } else {
            out.print("Datos Incompletos");
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

}
