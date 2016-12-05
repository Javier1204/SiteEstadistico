/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.controlador;

import gruposinvestigacion.fachada.Fachade;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import gruposinvestigacion.model.dto.Producto;
import gruposinvestigacion.model.dto.Proyecto;
import gruposinvestigacion.model.dto.Tipoproducto;
import gruposinvestigacion.util.JsonUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class ProductosController extends HttpServlet {

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
        
        if(request.getParameter("accion") != null && request.getParameter("accion").equals("0")){
            listarProductosPorProyecto(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("1")) {
            registrarProducto(request, response);
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
        processRequest(request, response);
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

    private void listarProductosPorProyecto(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");

                int codigoProyecto =Integer.parseInt(request.getParameter("codigoProyecto"));
                Proyecto proyecto = new Proyecto();
                proyecto.setCodigoproyecto(codigoProyecto);
                try {
                    out.print(JsonUtil.arrayToString(f.listarProductosPorProyecto(proyecto)));
                } catch (Exception ex) {
                    out.print("Error al listar estudiantes :"+ex.getMessage());
                }

            } else {
                out.print("Acceso Denegado.");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void registrarProducto(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");

                int codigoProyecto =Integer.parseInt(request.getParameter("proyecto"));
                int codigoTipoProducto = Integer.parseInt(request.getParameter("tipoDeProducto"));
                String informacionTecnica = request.getParameter("informacionTecnica");

                Proyecto proyecto = new Proyecto();
                proyecto.setCodigoproyecto(codigoProyecto);
                Tipoproducto tipoProducto = new Tipoproducto(codigoTipoProducto, "");
                Producto producto = new Producto(codigoProyecto, tipoProducto, informacionTecnica);
                try {
                    boolean exito = f.registrarProducto(producto, proyecto);
                    
                    if(exito){
                        out.print("Registro Exitoso");
                    }
                } catch (Exception ex) {
                    out.print("Error al registrar :"+ex.getMessage());
                }

            } else {
                out.print("Acceso Denegado.");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

}
