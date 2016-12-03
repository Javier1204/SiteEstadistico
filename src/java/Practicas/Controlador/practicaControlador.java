/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;

import Practicas.DAO.practicaDAO;
import Practicas.DTO.practicaDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class practicaControlador {

    public String RegistrarPractica(practicaDTO p) {                                    
        practicaDAO ent = new practicaDAO();
        return ent.registrarPractica(p);
    }   
    
    
    public ArrayList<practicaDTO> obtenerPracticas(){
        practicaDAO dao = new practicaDAO();
        return dao.consultarPracticas();
    }
    
   
    public ArrayList<practicaDTO> obtenerPracticas_anio(String semestre,String anio){
        practicaDAO dao = new practicaDAO();
        return dao.consultarPracticas_anio(semestre,anio);
    }
    
    public ArrayList<String> obtenerAnios(){
        practicaDAO dao = new practicaDAO();
        return dao.fechas_practicas();
    }
    
     public String editarPractica( practicaDTO p) throws SQLException {
                                    
        practicaDAO ent = new practicaDAO();
        return ent.editarPractica(p);
    }
    public practicaDTO buscarPractica(int id) {
       practicaDAO dao = new practicaDAO();
       return dao.buscarPractica(id);
    }
    
    public String eliminarPractica(int id) throws SQLException{
        practicaDAO ent= new practicaDAO();
        return ent.eliminarPractica(id);
    }

    public String generarEstadisticas(int añop, int semestrep) throws IOException{
        practicaDAO prac = new practicaDAO();
        return prac.generarEstaditicas(añop, semestrep);
    }
    
    public boolean generarInformes(int añop, int semestrep){
        practicaDAO prac = new practicaDAO();
        return prac.generarInformes(añop, semestrep);
    }
    
    public ArrayList fechas_practicas(){
       practicaDAO prac = new practicaDAO();
       return prac.fechas_practicas();
    }
    
    
}
    

