/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Integrador.Controlador;

import Integrador.DTO.PublicacionDTO;
import Integrador.Servicio.SrvPublicaciones;
import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.GestionUsuario;
import gestionUsuarios.IGestionUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author carlos
 */
@WebServlet(name = "GestorPublicaciones", urlPatterns = {"/GestorPublicaciones"})
public class GestorPublicaciones extends HttpServlet {
    
    private SrvPublicaciones srvPublicaciones = new SrvPublicaciones();

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
        String medio = request.getParameter("medio");
        if ("abrirVentanaCrearPublicacion".equals(medio)) {
            retornarVentanaCrearPublicacion(request, response);
        }else{
           this.listarPublicaciones(request, response);
        }
    }

    /**
     * este metodo lista todas las publicaciones registradas en el sistema de mayor a menor
     * segun la fecha
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException 
     */
    private void listarPublicaciones(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        ArrayList<PublicacionDTO> lista = this.srvPublicaciones.listarPublicaciones();
        request.setAttribute("publicaciones",lista);
        request.getRequestDispatcher("Integrador/listar_publicaciones.jsp").forward(request, response);
   
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
          String medio = request.getParameter("medio");
        if ("registrarPublicacion".equals(medio)) {
            this.crearPublicacion(request, response);
        }else if("eliminarPublicacion".equals(medio)){
          this.eliminarPublicacion(request, response);
        }else if("modificarPublicacion".equals(medio)){
        this.modificarPublicacion(request, response);
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

    /**
     * este metodo retorna la ventana pop-up para crear una publicacion
     */
    private void retornarVentanaCrearPublicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IGestionUsuarios gestor = GestionUsuario.getInstance();
        List<ModuloDTO> modulos = gestor.listarModulo();
        request.setAttribute("modulos", modulos);
        request.getRequestDispatcher("Integrador/crear_publicacion.jsp").forward(request, response);
        
    }
    
    private void crearPublicacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        try (PrintWriter out = response.getWriter()) {
            String titulo = request.getParameter("titulo");
            String modulo = request.getParameter("modulo");
            String informe = request.getParameter("informe");
            String texto = request.getParameter("texto");
         
            PublicacionDTO dto = new PublicacionDTO();
            dto.setTitulo(titulo);
           dto.setInforme(null);
            dto.setContenido(texto);
            out.println(this.srvPublicaciones.crearPublicacion(dto));
        }
        
    }
    
    private void modificarPublicacion(HttpServletRequest request, HttpServletResponse response){
    
    
    }
    
    private void eliminarPublicacion(HttpServletRequest request, HttpServletResponse response){
    
    }
    
}
