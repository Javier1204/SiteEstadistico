/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.util;

import com.google.gson.Gson;
import gruposinvestigacion.model.dao.DocenteDAO;
import gruposinvestigacion.model.dao.EstudianteDAO;
import gruposinvestigacion.model.dao.GrupoDAO;
import gruposinvestigacion.model.dao.IntegranteDAO;
import gruposinvestigacion.model.dao.LineaDeInvestigacionDAO;
import gruposinvestigacion.model.dao.ProductoDAO;
import gruposinvestigacion.model.dao.ProyectoDAO;
import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.GeneralEstudiante;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import gruposinvestigacion.model.dto.Proyecto;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author Administrator
 */
public class Prueba {

    public static void main(String[] args) {
        DocenteDAO dDAO = new DocenteDAO();
        ArrayList<GeneralDocente> docentes = null;
        EstudianteDAO eDAO = new EstudianteDAO();
        ArrayList<GeneralEstudiante> estudiantes = null;
        IntegranteDAO iDAO = new IntegranteDAO();
        GrupoDAO gDAO = new GrupoDAO();
        LineaDeInvestigacionDAO lDAO = new LineaDeInvestigacionDAO();
        ProyectoDAO pDAO = new ProyectoDAO();
        try {
            ProductoDAO prDAO = new ProductoDAO();
            Proyecto proyecto = pDAO.getProyecto(1);
            System.out.println(JsonUtil.arrayToString(prDAO.listarProductosPorProyecto(proyecto)));
            Gson gson = new Gson();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
