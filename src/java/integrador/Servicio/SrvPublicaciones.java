/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Integrador.Servicio;

import Integrador.DAO.PublicacionesDAO;
import Integrador.DTO.PublicacionDTO;
import java.util.ArrayList;

/**
 *
 * @author carlos
 */
public class SrvPublicaciones {
    
    public boolean crearPublicacion(PublicacionDTO dto){
    PublicacionesDAO dao=new PublicacionesDAO();
    return dao.crearPublicaciones(dto);
    
    }
    
    public ArrayList<PublicacionDTO> listarPublicaciones(){
    PublicacionesDAO dao=new PublicacionesDAO();
    return dao.listarPublicaciones();
    }
    
    public boolean eliminarPublicacion(int id){
    PublicacionesDAO dao=new PublicacionesDAO();
    return dao.eliminarPublicacion(id);
    }
    
    public boolean modificarPublicacion(PublicacionDTO dto){
    PublicacionesDAO dao=new PublicacionesDAO();
    return dao.modificarPublicacion(dto);
    }
    
    
}