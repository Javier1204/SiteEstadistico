/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CargaAcademica.Controlador;

import CargaAcademica.DAO.docenciaDAO;
import CargaAcademica.DTO.carga_grupoDTO;
import CargaAcademica.DTO.general_asignaturaDTO;
import CargaAcademica.DTO.observacionesDTO;
import java.util.ArrayList;

/**
 *
 * @author estudiante
 */
public class controladorDocencia {

    public String regitrarDocencia(carga_grupoDTO dto) {
        docenciaDAO dao=new docenciaDAO();
        return dao.registrarDocencia(dto);
    }

    public ArrayList<general_asignaturaDTO> obtenerAsignaturas() {
        docenciaDAO dao=new docenciaDAO();
        return dao.obtenerAsignaturas();
    
    }

    public String registrarObservacion(observacionesDTO dto) {
        docenciaDAO dao=new docenciaDAO();
        return dao.registrarObservacion(dto);
        
    }
    
}
