/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.fachada;

import gruposinvestigacion.controlador.Negocio;
import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.GeneralEstudiante;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import gruposinvestigacion.model.dto.Producto;
import gruposinvestigacion.model.dto.Proyecto;
import gruposinvestigacion.model.dto.Tipoproducto;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class Fachade implements Serializable {

    private Negocio negocio;

    public Fachade() {
        negocio = new Negocio();
    }

    public InvestigacionIntegrante getUsuario() {
        return negocio.getUsuario();
    }

    public void setUsuario(InvestigacionIntegrante i) {
        negocio.setUsuario(i);
    }

    public boolean editarInvestigacionIntegrante(InvestigacionIntegrante i) throws Exception {
        return negocio.editarInvestigacionIntegrante(i);
    }

    public InvestigacionIntegrante login(String codigo, String contrasena) throws Exception {
        return negocio.login(codigo, contrasena);
    }

    public boolean registrarGrupo(InvestigacionGrupo grupo) throws Exception {
        return negocio.registrarInvestigacionGrupo(grupo);
    }

    public boolean editarGrupo(InvestigacionGrupo grupo) throws Exception {
        return negocio.editarInvestigacionGrupo(grupo);
    }

    public boolean eliminarGrupo(InvestigacionGrupo grupo) throws Exception {
        return negocio.eliminarInvestigacionGrupo(grupo);
    }

    public InvestigacionGrupo getGrupo(String codigoColciencias) throws Exception {
        return negocio.getInvestigacionGrupo(codigoColciencias);
    }

    public ArrayList<InvestigacionGrupo> listarGrupos() throws Exception {
        return negocio.listarInvestigacionGrupos();
    }

    public ArrayList<GeneralDocente> listarGeneralDocentes() throws Exception {
        return negocio.listarGeneralDocentes();
    }

    public ArrayList<GeneralEstudiante> listarEstudiantes() throws Exception{
        return negocio.listarEstudiantes();
    }
    public ArrayList<InvestigacionLineasinvestigacion> listarLineasDeInvestigacion(InvestigacionGrupo grupo) throws Exception {
        return negocio.listarLineasDeInvestigacion(grupo);
    }

    public boolean modificarLineaDeInvestigacion(InvestigacionLineasinvestigacion lineaDeInvestigacion) throws Exception {
        return negocio.modificarLineaDeInvestigacion(lineaDeInvestigacion);
    }

    public boolean registrarLineaDeInvestigacion(InvestigacionLineasinvestigacion lineaDeInvestigacion, InvestigacionGrupo grupo) throws Exception {
        return negocio.registrarLineaDeInvestigacion(lineaDeInvestigacion, grupo);
    }
    
    public boolean eliminarLinea(InvestigacionLineasinvestigacion lineaDeInvestigacion) throws Exception{
        return negocio.eliminarLinea(lineaDeInvestigacion);
    }
    
    public boolean registrarIntegrante(InvestigacionIntegrante integrante, InvestigacionGrupo grupo) throws Exception{
        return negocio.registrarIntegrante(integrante, grupo);
    }
    
    public ArrayList<InvestigacionIntegrante> listarIntegrantesPorGrupo(InvestigacionGrupo grupo) throws Exception{
        return negocio.listarInvestigacionIntegrantesPorGrupo(grupo);
    }

    public boolean registrarProyecto(Proyecto proyecto, InvestigacionGrupo grupo) throws Exception{
        return negocio.registrarProyecto(proyecto , grupo);
    }
    
    public ArrayList<Proyecto> listarProyectosPorGrupo(InvestigacionGrupo grupo) throws Exception{
        return negocio.listarProyectosPorGrupo(grupo);
    }
    
    public ArrayList<Tipoproducto> listarTiposDeProducto() throws Exception{
        return negocio.listarTiposDeProducto();
    }
    public boolean registrarProducto(Producto producto, Proyecto proyecto) throws Exception{
        return negocio.registrarProducto(producto, proyecto);
    }
    
    public ArrayList<Producto> listarProductosPorProyecto(Proyecto proyecto) throws Exception{
        return negocio.listarProductosPorProyecto(proyecto);
    }
}
