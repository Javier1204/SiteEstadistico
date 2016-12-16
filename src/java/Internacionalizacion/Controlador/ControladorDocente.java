/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Controlador;

import Internacionalizacion.Modelo.DAO.DAODocente;
import Internacionalizacion.Modelo.DTO.Actividad;
import Internacionalizacion.Modelo.DTO.Docente;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class ControladorDocente {
    
    public ArrayList<Docente> obtenerDocentes(){
        DAODocente d = new DAODocente();
        return d.ObtenerDocentes();
        
    } 

    public Docente consultarDocente(String codigo) {
        DAODocente d = new DAODocente();
        return d.consultarDocente(codigo);
    }
    public String habilitarDocente(String responsable, int a) {
        DAODocente d = new DAODocente();
        return d.habilitarDocente(responsable, a);
    }

    
    
}
