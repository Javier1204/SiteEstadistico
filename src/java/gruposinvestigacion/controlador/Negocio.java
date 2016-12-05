/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.controlador;

import gruposinvestigacion.model.dao.DocenteDAO;
import gruposinvestigacion.model.dao.EstudianteDAO;
import gruposinvestigacion.model.dao.GrupoDAO;
import gruposinvestigacion.model.dao.IntegranteDAO;
import gruposinvestigacion.model.dao.LineaDeInvestigacionDAO;
import gruposinvestigacion.model.dao.ProductoDAO;
import gruposinvestigacion.model.dao.ProyectoDAO;
import gruposinvestigacion.model.dao.TipoProductoDAO;
import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.GeneralEstudiante;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import gruposinvestigacion.model.dto.Producto;
import gruposinvestigacion.model.dto.Proyecto;
import gruposinvestigacion.model.dto.Tipoproducto;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class Negocio<T> implements Serializable {

    private InvestigacionIntegrante<T> usuario;

    public Negocio() {
    }

    public InvestigacionIntegrante<T> getUsuario() {
        return usuario;
    }

    public void setUsuario(InvestigacionIntegrante<T> usuario) {
        this.usuario = usuario;
    }

    public boolean editarInvestigacionIntegrante(InvestigacionIntegrante i) throws Exception {

        return true;
    }

    public InvestigacionIntegrante login(String codigo, String contrasena) throws Exception {

        IntegranteDAO iDAO = new IntegranteDAO();
        InvestigacionIntegrante i = iDAO.validarLogin(codigo, contrasena);
        this.usuario = i;
        return i;

    }

    public ArrayList<InvestigacionIntegrante> listarInvestigacionIntegrantes() throws Exception {
        IntegranteDAO iDAO = new IntegranteDAO();
        return (ArrayList<InvestigacionIntegrante>) iDAO.listarInvestigacionIntegrantes();
    }
    
    public ArrayList<InvestigacionIntegrante> listarInvestigacionIntegrantesPorGrupo(InvestigacionGrupo grupo) throws Exception{
        IntegranteDAO iDAO = new IntegranteDAO();
        return iDAO.listarInvestigacionIntegrantesPorGrupo(grupo);
    }

    public boolean registrarInvestigacionGrupo(InvestigacionGrupo grupo) throws Exception {
        GrupoDAO gDAO = new GrupoDAO();
        gDAO.registrarGrupo(grupo);
        return true;
    }

    public boolean editarInvestigacionGrupo(InvestigacionGrupo grupo) throws Exception {
        GrupoDAO gDAO = new GrupoDAO();
        gDAO.modificarGrupo(grupo);
        return true;
    }

    public boolean eliminarInvestigacionGrupo(InvestigacionGrupo grupo) throws Exception {
        GrupoDAO gDAO = new GrupoDAO();
        return gDAO.desactivarGrupo(grupo);
    }

    public InvestigacionGrupo getInvestigacionGrupo(String codigoColciencias) throws Exception {
        GrupoDAO gDAO = new GrupoDAO();
        return gDAO.getGrupo(codigoColciencias);
    }

    public ArrayList<InvestigacionGrupo> listarInvestigacionGrupos() throws Exception {
        GrupoDAO gDAO = new GrupoDAO();
        return (ArrayList<InvestigacionGrupo>) gDAO.listarGrupos();
    }

    public GeneralDocente getGeneralDocente(String codigo) throws Exception {
        DocenteDAO gDAO = new DocenteDAO();
        return gDAO.get(codigo);
    }

    public ArrayList<GeneralDocente> listarGeneralDocentes() throws Exception {
        DocenteDAO gDAO = new DocenteDAO();
        return (ArrayList<GeneralDocente>) gDAO.getGeneralDocentes();
    }

    public ArrayList<GeneralEstudiante> listarEstudiantes() throws Exception{
        EstudianteDAO eDAO = new EstudianteDAO();
        return eDAO.getGeneralEstudiantes();
    }
    public ArrayList<InvestigacionLineasinvestigacion> listarLineasDeInvestigacion(InvestigacionGrupo grupo) throws Exception {
        LineaDeInvestigacionDAO lDAO = new LineaDeInvestigacionDAO();
        return lDAO.getLineasPorGrupo(grupo);
    }

    public boolean modificarLineaDeInvestigacion(InvestigacionLineasinvestigacion lineaDeInvestigacion) throws Exception {
        LineaDeInvestigacionDAO lDAO = new LineaDeInvestigacionDAO();
        return lDAO.modificarLinea(lineaDeInvestigacion);
    }

    public boolean registrarLineaDeInvestigacion(InvestigacionLineasinvestigacion lineaDeInvestigacion, InvestigacionGrupo grupo) throws Exception {
        LineaDeInvestigacionDAO lDAO = new LineaDeInvestigacionDAO();
        return lDAO.registrarLinea(lineaDeInvestigacion, grupo);
    }
    
    public boolean eliminarLinea(InvestigacionLineasinvestigacion lineaDeInvestigacion) throws Exception{
        LineaDeInvestigacionDAO lDAO = new LineaDeInvestigacionDAO();
        return lDAO.eliminarLinea(lineaDeInvestigacion);
    }
    
    public boolean registrarIntegrante(InvestigacionIntegrante integrante, InvestigacionGrupo grupo) throws Exception{
        IntegranteDAO iDAO = new IntegranteDAO();
        return iDAO.registrarIntegrante(integrante, grupo);
    }

    public boolean registrarProyecto(Proyecto proyecto, InvestigacionGrupo grupo)throws Exception {
        ProyectoDAO pDAO = new ProyectoDAO();
        return pDAO.registrarProyecto(proyecto, grupo);
    }
    
    public ArrayList<Proyecto> listarProyectosPorGrupo(InvestigacionGrupo grupo) throws Exception{
        ProyectoDAO pDAO = new ProyectoDAO();
        return pDAO.listarProyectosPorGrupo(grupo);
    }
    
    public ArrayList<Tipoproducto> listarTiposDeProducto() throws Exception{
        TipoProductoDAO tpDAO = new TipoProductoDAO();
        return tpDAO.getTipoproductos();
    }
    
    public boolean registrarProducto(Producto producto, Proyecto proyecto) throws Exception{
        ProductoDAO pDAO = new ProductoDAO();
        return pDAO.registrarProducto(producto, proyecto);
    }
    
    public ArrayList<Producto> listarProductosPorProyecto(Proyecto proyecto) throws Exception{
        ProductoDAO pDAO = new ProductoDAO();
        return pDAO.listarProductosPorProyecto(proyecto);
    }
}
