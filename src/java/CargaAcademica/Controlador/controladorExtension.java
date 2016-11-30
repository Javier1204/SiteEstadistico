/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.Controlador;

import CargaAcademica.DAO.carga_extensionDAO;
import CargaAcademica.DTO.carga_extensionDTO;
import java.util.ArrayList;

/**
 *
 * @author jesus
 */
public class controladorExtension {

    public controladorExtension(){}
    
    /**
     * 
     * @param dto
     * @return 
     */
    public String registrarExtension(carga_extensionDTO dto) {
        carga_extensionDAO dao=new carga_extensionDAO();
      return  dao.registrarExtension(dto);
    }
    
    public ArrayList<carga_extensionDTO> obtenerExtension(){
        carga_extensionDAO dao=new carga_extensionDAO();
        return dao.listarExtension();
    }
    
    
}
