/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.fachada;

import gruposinvestigacion.controlador.AdminNegocio;
import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class AdminFachade implements Serializable{
    
    AdminNegocio negocio;

    public AdminFachade() {
        negocio = new AdminNegocio();
    }
    
    public boolean login(String codigo, String contrasena) throws Exception {
        return this.negocio.login(codigo, contrasena);
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

    public ArrayList<InvestigacionLineasinvestigacion> listarLineasDeInvestigacion(InvestigacionGrupo grupo) throws Exception {
        return negocio.listarLineasDeInvestigacion(grupo);
    }
}
