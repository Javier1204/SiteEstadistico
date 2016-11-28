/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Controlador;

import Internacionalizacion.Modelo.DAO.DAOConvenio;
import Internacionalizacion.Modelo.DTO.Convenio;
import Internacionalizacion.Modelo.DTO.Tipo_actividades;
import java.util.ArrayList;

/**
 *
 * @author HeinerV
 */
public class ControladorConvenio {


    
    public String registrarConvenio(String radicado, String nombre, String descripcion, String fecharadicacion, String fechainicio, String fechaterminacion, String vigencia, String estado, String tipo, int entidad) {
        DAOConvenio convenio= new DAOConvenio();
        Convenio c= new Convenio(radicado, nombre, descripcion ,fecharadicacion, fechainicio, fechaterminacion, vigencia, estado, tipo, entidad);
        //consultar convenio por nombre para obtener su id
        //Convenio resultado =convenio.consultarConvenio(nombre);
        //System.out.println("El convenio creado es:"+c.getNombre());
        //Tipo_actividades a = new Tipo_actividades();
        /* a.setIdconvenio(resultado.getId());
        a.setMovilidad(act[0]);
        a.setPasantia(act[1]);
        a.setExtension(act[2]);
        a.setInvestigacion(act[3]);
        a.setSocial(act[4]);
        a.setPractica(act[5]);
       */
        //ControladorTipo_actividades t = new ControladorTipo_actividades();
        //t.registrarTipo_actividades(a);
        
        return convenio.registrarConvenio(c);
    }
    
    public ArrayList<Convenio> obtenerConvenios(){
        DAOConvenio dao = new DAOConvenio();
        return dao.consultarConvenios();
    }
    
    public Convenio consultarConvenio(String nombreconvenio){
        DAOConvenio dao = new DAOConvenio();
        return dao.consultarConvenio(nombreconvenio);
    }
    
}
