/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;
import Practicas.DAO.empresaDAO;
import Practicas.DTO.empresaDTO;
import java.util.ArrayList;
/**
 *
 * @author Usuario
 */
public class empresaControlador {
    
        
    
    public ArrayList<empresaDTO> consultarEmpresas(){
        
        empresaDAO dao = new empresaDAO();
        return dao.consultarEmpresa();
    }
    public String registrarEmpresa( empresaDTO p) {
                                    
        empresaDAO ent = new empresaDAO();
        return ent.registrarEmpresa(p);
    }
    
}
