/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Praticas.Facade;

import Practicas.Controlador.*;
import Practicas.DAO.convenioDAO;
import Practicas.DTO.convenioDTO;
import Practicas.DTO.docenteDTO;
import Practicas.DTO.documentos_estudiantes_DTO;
import Practicas.DTO.informeDTO;
import Practicas.DTO.perfilDTO;
import Practicas.DTO.perfil_estudianteDTO;
import Practicas.DTO.practicaDTO;
import Practicas.DTO.tutor_empresaDTO;
import java.util.ArrayList;
import practicas.DTO.empresaDTO;

/**
 *
 * @author JAVIER
 */
public class Facade {
    
    
    
    
    
    //METODOS PARA EL MANEJO DE LAS ENTIDADES.
    
    public String registrarEmpresa( String NIT, String sectorEmpresa, String nombreEmpresa, String tipoAmbito, String direccion, String telefono) throws Exception{
         empresaControlador s=new empresaControlador();
         return s.registrarEmpresa(NIT, sectorEmpresa, nombreEmpresa, tipoAmbito, direccion, telefono);               
    }
    
    public ArrayList<empresaDTO> obtenerEmpresa(){
        empresaControlador c = new empresaControlador();
        return c.consultarEmpresas();
    }
    
    
}
