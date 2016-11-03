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
 * @author JAVIER
 */
public class ControladorConvenio {
    
    public ArrayList<Convenio> obtenerConvenios(){
        DAOConvenio dao = new DAOConvenio();
        return dao.consultarConvenios();
    }
    
}
