/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;

import Practicas.DAO.perfilDAO;
import Practicas.DTO.perfilDTO;
import java.util.List;

/**
 *
 * @author Administrador
 */
public class perfilControlador {

    public int id_perfil_maximo() {
        perfilDAO dao= new perfilDAO();
        return dao.id_maximo_perfil();
    }
    
    public String RegistrarPerfil(perfilDTO p) {
       perfilDAO dao = new perfilDAO();
       return dao.registrarPerfil(p);
    }
    
    public List<perfilDTO> listarPerfiles(){
        perfilDAO dao = new perfilDAO();
        return dao.listarPerfiles();
    }
}
