/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.controlador;

import gruposinvestigacion.fachada.Fachade;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import gruposinvestigacion.util.JsonUtil;
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
public class LineasController extends HttpServlet {

    private Fachade f;

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
            out.println("<title>Servlet LineasController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LineasController at " + request.getContextPath() + "</h1>");
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

        if(request.getParameter("accion") != null && request.getParameter("accion").equals("0")){
            listarLineas(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("1")) {
            registrarLinea(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("2")) {
            modificarLinea(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("3")) {
            eliminarLinea(request, response);
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

    private void registrarLinea(HttpServletRequest request, HttpServletResponse response) {
        
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");

                String nombre = request.getParameter("nombre");
                String objetivos = request.getParameter("objetivos");
                String descripcion = request.getParameter("descripcion");
                InvestigacionGrupo grupo = (InvestigacionGrupo)request.getSession().getAttribute("grupo");
                InvestigacionLineasinvestigacion linea = new InvestigacionLineasinvestigacion(0, nombre, objetivos, descripcion);
                boolean exito;
                try {
                    exito = f.registrarLineaDeInvestigacion(linea, grupo);
                    if (exito) {
                        out.print("Registro Exitoso");
                    } else {
                        out.print("No se pudo registrar la línea.");
                    }
                } catch (Exception ex) {
                    out.print("No se pudo registrar la línea. Error "+ex.getMessage());
                }

            } else {
                out.print("Acceso Denegado.");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void modificarLinea(HttpServletRequest request, HttpServletResponse response) {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");

                int codigoLinea = Integer.parseInt(request.getParameter("codigoLinea"));
                String nombre = request.getParameter("nombre");
                String objetivos = request.getParameter("objetivos");
                String descripcion = request.getParameter("descripcion");

                InvestigacionLineasinvestigacion linea = new InvestigacionLineasinvestigacion(codigoLinea, nombre, objetivos, descripcion);
                boolean exito;
                try {
                    exito = f.modificarLineaDeInvestigacion(linea);
                    if (exito) {
                        out.print("Modificación Exitosa");
                    } else {
                        out.print("No se encuentra la línea.");
                    }
                } catch (Exception ex) {
                    out.print("No se pudo modificar la línea. Error "+ex.getMessage());
                }

            } else {
                out.print("Acceso Denegado.");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void listarLineas(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");

                String codigoGrupo = request.getParameter("codigoGrupo");
                InvestigacionGrupo grupo = new InvestigacionGrupo();
                grupo.setCodigocolciencias(codigoGrupo);
                try {
                    out.print(JsonUtil.arrayToString(f.listarLineasDeInvestigacion(grupo)));
                } catch (Exception ex) {
                    out.print("Error al cargar las líneas :"+ex.getMessage());
                }

            } else {
                out.print("Acceso Denegado.");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void eliminarLinea(HttpServletRequest request, HttpServletResponse response){
        
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");

                int codigoLinea = Integer.parseInt(request.getParameter("codigoLinea"));

                InvestigacionLineasinvestigacion linea = new InvestigacionLineasinvestigacion();
                linea.setCodigolinea(codigoLinea);
                boolean exito;
                try {
                    exito = f.eliminarLinea(linea);
                    if (exito) {
                        out.print("Línea Eliminada");
                    } else {
                        out.print("No se encuentra la línea.");
                    }
                } catch (Exception ex) {
                    out.print("No se pudo eliminar la línea. Error "+ex.getMessage());
                }

            } else {
                out.print("Acceso Denegado.");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
