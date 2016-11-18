/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asesorias.Controller;
import asesorias.DAO.asesoriaDao;
import asesorias.DAO.generalDAO;
import asesorias.DTO.Asesoria;
/**
 *
 * @author DiegoLeal
 */
public class ControladorAsesorias {
    
    public String consultarMateriasDocentes(String codigoDocente){
        generalDAO gd = new generalDAO();
        return gd.consultarMateriasDocente(codigoDocente);
    }
    
    public String consultarEstudiantes(String codMateria, String grupo){
        generalDAO gd = new generalDAO();
        return gd.consultarEstudiantes(codMateria, grupo);
    }
    
    public String registrarAsesoria(Asesoria asesoria){
        asesoriaDao ad = new asesoriaDao();
        return ad.registrarAsesoria(asesoria);
    }
    
    public String consultarDocenteNombre(String docente){
        generalDAO gd = new generalDAO();
        return gd.consultarDocenteNombre(docente);
    }
    
    public String consultarMateriaNombre(String materia){
        generalDAO gd = new generalDAO();
        return gd.consultarMateriaNombre(materia);
    }
}
