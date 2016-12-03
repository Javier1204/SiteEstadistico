
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;

import Practicas.DAO.convenioDAO;
import Practicas.DTO.convenioDTO;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Usuario
 */
public class convenioControlador {
    
    
    public String registrarConvenio(convenioDTO t) {
        convenioDAO convenio= new convenioDAO();
        return convenio.registrarConvenio(t);
    }
    
    
    public ArrayList<convenioDTO> obtenerConvenios(){
        convenioDAO dao = new convenioDAO();
        return dao.consultarConvenios();
    }
    
    public convenioDTO consultarConvenio(String nombreconvenio){
        convenioDAO dao = new convenioDAO();
        return dao.consultarConvenio(nombreconvenio);
    }
    
    public convenioDTO buscarConvenio(String id) {
       convenioDAO dao = new convenioDAO();
       return dao.buscarConvenio(id);
    }
    
      public String editarConvenio( convenioDTO p) throws SQLException {
                                    
        convenioDAO ent = new convenioDAO();
        return ent.editarConvenio(p);
    }
       
      public String eliminarConvenio(String id) throws SQLException{
        convenioDAO ent= new convenioDAO();
        return ent.eliminarConvenio(id);
    }
}
