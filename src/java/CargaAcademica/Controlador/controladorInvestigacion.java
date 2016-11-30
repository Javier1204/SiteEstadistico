/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.Controlador;

import CargaAcademica.DAO.carga_investigacionDAO;
import CargaAcademica.DTO.carga_investigacionDTO;
import java.util.ArrayList;

/**
 *
 * @author jesus
 */
public class controladorInvestigacion {
    
    
    public String registrarInvestigacion(carga_investigacionDTO dto){
        carga_investigacionDAO dao=new carga_investigacionDAO();
        return dao.regsitrarInvestigacion(dto);
    }

    public ArrayList<carga_investigacionDTO> obtenerInvestigaciones() {
         carga_investigacionDAO dao=new carga_investigacionDAO();
         return dao.obtenerInvestigaciones();
    }
}
