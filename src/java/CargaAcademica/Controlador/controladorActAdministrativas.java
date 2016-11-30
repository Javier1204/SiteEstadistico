/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.Controlador;

import CargaAcademica.DAO.carga_ActAdministrativasDAO;
import CargaAcademica.DTO.carga_ActAdministrativasDTO;
import java.util.ArrayList;

/**
 *
 * @author jesus
 */
public class controladorActAdministrativas {
    
    /**
     * 
     * @param dto
     * @return 
     */
    public String registrarActAdministrativa(carga_ActAdministrativasDTO dto) {
        carga_ActAdministrativasDAO dao=new carga_ActAdministrativasDAO();
      return  dao.registrarActAdministrativa(dto);
    }
    
    /**
     * 
     * @return 
     */
    public ArrayList<carga_ActAdministrativasDTO> listarActAdmi(){
        carga_ActAdministrativasDAO dao=new carga_ActAdministrativasDAO();
        return dao.listarActAdmi();
    }
}
