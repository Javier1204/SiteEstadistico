/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.controlador;

import gruposinvestigacion.fachada.Fachade;
import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import gruposinvestigacion.model.dto.Proyecto;
import gruposinvestigacion.util.JsonUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class ProyectosController extends HttpServlet {

    private Fachade f;
    private SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-mm-dd");
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
            out.println("<title>Servlet ProyectosController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProyectosController at " + request.getContextPath() + "</h1>");
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
            listarProyectosPorGrupo(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("1")) {
            registrarProyecto(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("2")) {
            modificarProyecto(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("3")) {
            desactivarProyecto(request, response);
        } else if (request.getParameter("accion") != null && request.getParameter("accion").equals("4")) {
            activarProyecto(request, response);
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

    private void listarProyectosPorGrupo(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");
                
                String codigoGrupo = request.getParameter("codigoColciencias");
                InvestigacionGrupo grupo = new InvestigacionGrupo();
                grupo.setCodigocolciencias(codigoGrupo);
                
                try {
                    out.print(JsonUtil.arrayToString(f.listarProyectosPorGrupo(grupo)));
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

    private void registrarProyecto(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("fachada") != null) {
                f = (Fachade) request.getSession().getAttribute("fachada");

                String codigoGrupo = request.getParameter("codigoColciencias");
                int codigolinea =Integer.parseInt(request.getParameter("lineainvestigacion"));
                String nombreproyecto = request.getParameter("nombreproyecto");
                String codigoLider = request.getParameter("integrante_codigoLider");
                String fechainicioSt = request.getParameter("fechainicio");
                String fechafinSt = request.getParameter("fechafin");
                String tipoFinanciamiento = request.getParameter("tipoFinanciamiento");
                System.out.println(nombreproyecto);
                InvestigacionGrupo grupo = new InvestigacionGrupo();
                grupo.setCodigocolciencias(codigoGrupo);
                InvestigacionLineasinvestigacion linea = new InvestigacionLineasinvestigacion();
                linea.setCodigolinea(codigolinea);
                InvestigacionIntegrante lider = new InvestigacionIntegrante();
                lider.setCodigo(codigoLider);
                Date fechaInicio = formatoDelTexto.parse(fechainicioSt);
                Date fechaFin = formatoDelTexto.parse(fechafinSt);
                Proyecto proyecto = new Proyecto(codigolinea, linea, nombreproyecto, lider, fechaInicio, fechaFin, tipoFinanciamiento);

                try {
                    boolean exito = f.registrarProyecto(proyecto, grupo);
                    
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
        } catch (ParseException ex) {
            Logger.getLogger(ProyectosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void modificarProyecto(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void desactivarProyecto(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private void activarProyecto(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
