/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Controlador;

import Internacionalizacion.Modelo.DAO.DAOActividad_Estudiante;
import Internacionalizacion.Modelo.DTO.Actividad_Estudiante;

/**
 *
 * @author JAVIER
 */
public class ControladorActividad_Estudiante {
    
    public String RegistrarActividad_Estudiante(Actividad_Estudiante a){
        DAOActividad_Estudiante act = new DAOActividad_Estudiante();
        return act.registrarActividad_Estudiante(a);
    }
}
