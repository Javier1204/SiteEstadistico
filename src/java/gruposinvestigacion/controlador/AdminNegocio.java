/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.controlador;

import gruposinvestigacion.model.dao.AdminDAO;
import gruposinvestigacion.model.dao.DocenteDAO;
import gruposinvestigacion.model.dao.GrupoDAO;
import gruposinvestigacion.model.dao.LineaDeInvestigacionDAO;
import gruposinvestigacion.model.dto.Admin;
import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class AdminNegocio implements Serializable{

    private Admin admin;

    public AdminNegocio() {
    }

    public boolean login(String codigo, String contrasena) throws Exception {

        AdminDAO aDAO = new AdminDAO();
        this.admin = aDAO.validarLogin(codigo, contrasena);

        return admin != null;
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
    
    
    public ArrayList<GeneralDocente> listarGeneralDocentes() throws Exception {
        DocenteDAO gDAO = new DocenteDAO();
        return (ArrayList<GeneralDocente>) gDAO.getGeneralDocentes();
    }

    public ArrayList<InvestigacionLineasinvestigacion> listarLineasDeInvestigacion(InvestigacionGrupo grupo) throws Exception {
        LineaDeInvestigacionDAO lDAO = new LineaDeInvestigacionDAO();
        return (ArrayList<InvestigacionLineasinvestigacion>) lDAO.getLineasPorGrupo(grupo);
    }
}
