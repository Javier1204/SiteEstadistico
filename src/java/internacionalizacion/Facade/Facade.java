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
import internacionalizacion.Modelo.DTO.Entidad;
import internacionalizacion.Modelo.DTO.Pais;
import internacionalizacion.Modelo.DTO.Tipo_actividades;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class Facade {
    
    
    //METODOS PARA EL MANEJO DE LOS CONVENIOS.
    
    public boolean RegistrarActividad(Actividad a){
        ControladorActividad c = new ControladorActividad();
        return c.RegistrarActividad(a);
    }
    
    
    //METODOS PARA EL REGISTRO DE LOS TIPOS DE ACTIVIDADES QUE PUEDEN HACERSE EN UN CONVENIO.
    
    public boolean RegistrarTipo_Actividades(Tipo_actividades act){
        ControladorTipo_actividades c = new ControladorTipo_actividades();
        return c.registrarTipo_actividades(act);
    }
    
    //METODOS PARA EL MANEJO DE LAS ENTIDADES.
    
    public String registrarEntidad(String nombre,String representante,String sector,String ambito,String tipo,String telefono,String direccion,int pais,String nit) throws Exception{
         ControladorEntidad s=new ControladorEntidad();
         return s.registrarEntidad(nombre,representante,sector,tipo,telefono,direccion,pais,nit);               
    }
    
    public ArrayList<Entidad> obtenerEntidades(){
        ControladorEntidad c = new ControladorEntidad();
        return c.consultarEntidades();
    }
    
    //METODOS PARA EL MANEJO DE LOS CONVENIOS.
    //public String registrarConvenio(String nombre,String descripcion,String vigencia,String tipo,String estado,String fechacreacion,String fechaterminacion,int entidad, boolean[] act) throws Exception{
    public String registrarConvenio(String nombre,String descripcion,String vigencia,String tipo,String estado,String fechacreacion,String fechaterminacion,int entidad) throws Exception{
         ControladorConvenio s=new ControladorConvenio();
         //return s.registrarConvenio(nombre, descripcion,vigencia,tipo,estado,fechacreacion,fechaterminacion, entidad,act); 
         return s.registrarConvenio(nombre, descripcion,vigencia,tipo,estado,fechacreacion,fechaterminacion, entidad);               
    }
    
    public ArrayList<Convenio> obtenerConvenios(){
        ControladorConvenio c = new ControladorConvenio();
        return c.obtenerConvenios();
    }
    
    public Convenio consultarConvenio(String nombreconvenio){
        ControladorConvenio c = new ControladorConvenio();
        return c.consultarConvenio(nombreconvenio);
    }
    
    //METODOS PARA EL MANEJO DE LOS PAISES.
    
    public ArrayList<Pais> obtenerPaises(){
        ControladorPais c = new ControladorPais();
        return c.obtenerPaises();
        
    }
    
    //Metodos para el manejo de los tipos de actividades que puede tener un convenio.
    
     public ArrayList<String> obtenerActividades(int idconvenio){
        ControladorTipo_actividades c = new ControladorTipo_actividades();
        return c.obtenerActividades(idconvenio);
    }
    
}
