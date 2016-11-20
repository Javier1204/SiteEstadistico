/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Integrador.Servicio;

import Integrador.DAO.PublicacionesDAO;
import Integrador.DTO.PublicacionDTO;

/**
 *
 * @author carlos
 */
public class SrvPublicaciones {
    
    public boolean crearPublicacion(PublicacionDTO dto){
    PublicacionesDAO dao=new PublicacionesDAO();
    return dao.crearPublicaciones(dto);
    
    }
    
}
