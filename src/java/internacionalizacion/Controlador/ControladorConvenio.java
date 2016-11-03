/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Controlador;

import internacionalizacion.Modelo.DAO.DAOConvenio;
import internacionalizacion.Modelo.DTO.Convenio;
import java.util.ArrayList;

/**
 *
 * @author HeinerV
 */
public class ControladorConvenio {

    public String registrarEntidad(String nombre, String descripcion, String vigencia, String tipo, String estado, String fechacreacion, String fechaterminacion, int entidad) {
        DAOConvenio convenio= new DAOConvenio();
        Convenio c= new Convenio(nombre, descripcion,vigencia,tipo,estado,fechacreacion,fechaterminacion, entidad);
        
        return convenio.registrarConvenio(c);
    }
    
    public ArrayList<Convenio> obtenerConvenios(){
        DAOConvenio dao = new DAOConvenio();
        return dao.consultarConvenios();
    }
    
}
