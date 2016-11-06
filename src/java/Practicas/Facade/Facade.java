/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Facade;

import Practicas.Controlador.PerfilControlador;
import Practicas.Controlador.empresaControlador;
import Practicas.DTO.perfilDTO;
import java.util.ArrayList;
import practicas.DTO.empresaDTO;

/**
 *
 * @author Administrador
 */
public class Facade {
    
     public String RegistrarPerfil(perfilDTO p){
        PerfilControlador c = new PerfilControlador();
        return c.RegistrarPerfil(p);
    }
     
    public int idperfilMaximo(){
        PerfilControlador c= new PerfilControlador();
        return c.id_perfil_maximo();
    } 
    
     public String registrarEmpresa( String NIT, String sectorEmpresa, String nombreEmpresa, String tipoAmbito, String direccion, String telefono) throws Exception{
         empresaControlador s=new empresaControlador();
         return s.registrarEmpresa(NIT, sectorEmpresa, nombreEmpresa, tipoAmbito, direccion, telefono);               
    }
    
    public ArrayList<empresaDTO> obtenerEmpresa(){
        empresaControlador c = new empresaControlador();
        return c.consultarEmpresas();
    }
}
