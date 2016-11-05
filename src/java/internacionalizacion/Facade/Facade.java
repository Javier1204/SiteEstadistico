/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Facade;

import internacionalizacion.Controlador.*;
import internacionalizacion.Modelo.DAO.DAOConvenio;

import internacionalizacion.Modelo.DTO.Actividad;
import internacionalizacion.Modelo.DTO.Convenio;
import internacionalizacion.Modelo.DTO.Pais;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class Facade {
    
    
    //Metodos para el manejo de las actividades.
    
    public boolean RegistrarActividad(Actividad a){
        ControladorActividad c = new ControladorActividad();
        return c.RegistrarActividad(a);
    }
    
    //Metodos para el manejos de las entidades.
    
    public String registrarEntidad(String nombre,String representante,String sector,String ambito,String tipo,String telefono,int pais,String nit) throws Exception{
         ControladorEntidad s=new ControladorEntidad();
         return s.registrarEntidad(nombre,representante,sector,ambito,tipo,telefono,pais,nit);               
    }
    
    //Metodos para el manejo de los convenios.
    //public String registrarConvenio(String nombre,String descripcion,String vigencia,String tipo,String estado,String fechacreacion,String fechaterminacion,int entidad, boolean[] act) throws Exception{
    public String registrarConvenio(String nombre,String descripcion,String vigencia,String tipo,String estado,String fechacreacion,String fechaterminacion,int entidad) throws Exception{
         ControladorConvenio s=new ControladorConvenio();
         //return s.registrarConvenio(nombre, descripcion,vigencia,tipo,estado,fechacreacion,fechaterminacion, entidad,act); 
         return s.registrarConvenio(nombre, descripcion,vigencia,tipo,estado,fechacreacion,fechaterminacion, entidad);               
    }
    
    public ArrayList<Convenio> obtenerConvenios(){
        DAOConvenio dao = new DAOConvenio();
        return dao.consultarConvenios();
    }
    
    //Metodos para el manejo de paises
    
    public ArrayList<Pais> obtenerPaises(){
        ControladorPais c = new ControladorPais();
        return c.obtenerPaises();
        
    }
    
}
