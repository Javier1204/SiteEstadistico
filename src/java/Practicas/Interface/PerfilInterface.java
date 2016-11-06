/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Interface;

import Practicas.DTO.perfilDTO;
import java.util.List;

/**
 *
 * @author Administrador
 */
public interface PerfilInterface {
    
    public String registrarPerfil(perfilDTO p);
    public boolean editarPerfil(Object o);
    public boolean eliminarPerfil(Object o);
    public List<perfilDTO> listarPerfiles();
    public perfilDTO buscarPerfil(int id);
    public int id_maximo_perfil();
}
