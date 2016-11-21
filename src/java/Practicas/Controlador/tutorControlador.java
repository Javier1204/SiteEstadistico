/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;

import Practicas.DTO.tutor_empresaDTO;
import Practicas.DAO.tutorDAO;
import java.util.ArrayList;
/**
 *
 * @author Usuario
 */
public class tutorControlador {
 
    
    public String registrarTutor( tutor_empresaDTO p) {
                                    
        tutorDAO ent = new tutorDAO();
        return ent.registrarTutor(p);
    }
    
    
    
    public ArrayList<tutor_empresaDTO> consultarTutores(){
        
        tutorDAO dao = new tutorDAO();
        return dao.consultarTutor();
    }
}
