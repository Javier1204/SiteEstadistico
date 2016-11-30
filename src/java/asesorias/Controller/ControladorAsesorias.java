/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asesorias.Controller;

import asesorias.DAO.asesoriaDao;
import asesorias.DAO.generalDAO;
import asesorias.DTO.Asesoria;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author DiegoLeal
 */
public class ControladorAsesorias {

    public String consultarMateriasDocentes(String codigoDocente) {
        generalDAO gd = new generalDAO();
        return gd.consultarMateriasDocente(codigoDocente);
    }

    public String consultarEstudiantes(String codMateria, String grupo) {
        generalDAO gd = new generalDAO();
        return gd.consultarEstudiantes(codMateria, grupo);
    }

    public String registrarAsesoria(Asesoria asesoria) {
        asesoriaDao ad = new asesoriaDao();
        String idGrupo = ad.consultarIdGrupo(asesoria);
        System.out.println("ESTE ES EL ID DEL GRUPO::: " + idGrupo);
        return ad.registrarAsesoria(asesoria, idGrupo);
    }

    public String consultarDocenteNombre(String docente) {
        generalDAO gd = new generalDAO();
        //periodo, fechacierre
        String periodo = gd.consultarPeriodo();
        String p[] = periodo.split(";");
        return gd.consultarDocenteNombre(docente, p[0], p[1]);
    }

    public String consultarMateriaNombre(String materia, String grupo) {
        generalDAO gd = new generalDAO();
        //periodo, fechacierre
        String periodo = gd.consultarPeriodo();
        String p[] = periodo.split(";");

        return gd.consultarMateriaNombre(materia, grupo, p[0], p[1]);
    }
    
    public String consultarDocenteCodigo(String docente){
        generalDAO gd = new generalDAO();
        return gd.consultarDocenteCodigo(docente);
    }
    
    public String consultarMateriaCodigo(String materia, String grupo){
        generalDAO gd = new generalDAO();
        //periodo, fechacierre
        String periodo = gd.consultarPeriodo();
        String p[] = periodo.split(";");
        
        return gd.consultarMateriaCodigo(materia, grupo, p[0], p[1]);
    }
    
    public String consultarAsesoriasAnteriores(String codDoc){
        generalDAO gd = new generalDAO();
        
        return gd.consultarAsesoriasAnteriores(codDoc);
    }
    
    public String consultarNombreEst(String codEst){
        generalDAO gd = new generalDAO();
        return gd.consultarNombreEst(codEst);
    }
    
    public String consultarNombreMat(String codMat){
        generalDAO gd = new generalDAO();
        return gd.consultarNombreMat(codMat);
    }
    
    public String consultarCantAsesoriasDocente(String codDoc, String periodo, String año){
        generalDAO gd = new generalDAO();
        return gd.consultarCantAsesoriasDocente(codDoc, periodo, año);
    }
    
    public String consultarAsesoriasMaterias(String periodo, String año){
        generalDAO gd = new generalDAO();
        return gd.consultarAsesoriasMaterias(periodo, año);
    }
    
    public String consultarEstudiantesMateria(String periodo, String año){
        generalDAO gd = new generalDAO();
        return gd.consultarEstudiantesMateria(periodo, año);
    }
    
    public String consultarHorasAsesoriasDocente(){
        generalDAO gd = new generalDAO();
        return gd.consultarHorasAsesoriasDocente();
    }
}
