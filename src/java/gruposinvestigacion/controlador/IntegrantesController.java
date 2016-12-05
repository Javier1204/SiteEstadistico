/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.controlador;

import gruposinvestigacion.fachada.Fachade;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
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
public class IntegrantesController extends HttpServlet {

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
            out.println("<title>Servlet IntegrantesController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IntegrantesController at " + request.getContextPath() + "</h1>");
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
            listarIntegrantesPorGrupo(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("1")) {
            registrarIntegrante(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("2")) {
            modificarIntegrante(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("3")) {
            desactivarIntegrante(request, response);
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

    private void listarIntegrantesPorGrupo(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");
                
                String codigoGrupo = request.getParameter("codigoColciencias");
                
                InvestigacionGrupo grupo = new InvestigacionGrupo();
                grupo.setCodigocolciencias(codigoGrupo);
                
                try {
                    out.print(JsonUtil.arrayToString(f.listarIntegrantesPorGrupo(grupo)));
                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.print("Error. No se pudo obtener los datos. "+ex.getMessage());
                }
            } else {
                out.print("Acceso Denegado.");
            }
        }catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void registrarIntegrante(HttpServletRequest request, HttpServletResponse response) {
        
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");

                String codigoGrupo = request.getParameter("codigoColciencias");
                String codigo = request.getParameter("selectIntegrante");
                int tipo = Integer.parseInt(request.getParameter("tipoIntegrante"));
                String contrasena = request.getParameter("contrasena");
                
                InvestigacionGrupo grupo = new InvestigacionGrupo();
                grupo.setCodigocolciencias(codigoGrupo);
                InvestigacionIntegrante integrante = new InvestigacionIntegrante();
                integrante.setCodigo(codigo);
                integrante.setTipo(tipo);
                integrante.setContrasena(contrasena);
                try {
                    boolean exito = f.registrarIntegrante(integrante, grupo);
                    
                    if(exito){
                        out.print("Registro Exitoso");
                    }
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

    private void modificarIntegrante(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void desactivarIntegrante(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
