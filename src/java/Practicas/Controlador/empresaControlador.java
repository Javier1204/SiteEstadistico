/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;
import Practicas.DAO.empresaDAO;
import practicas.DTO.empresaDTO;
import java.util.ArrayList;
/**
 *
 * @author Usuario
 */
public class empresaControlador {
    
    public String registrarEmpresa( String NIT, String sectorEmpresa, String nombreEmpresa, String tipoAmbito, String direccion, String telefono) {
                                    //String NIT, String sectorEmpresa, String nombreEmpresa, String tipoAmbito, String direccion, String telefono
        empresaDAO ent = new empresaDAO();
        empresaDTO e = new empresaDTO( NIT, sectorEmpresa, nombreEmpresa, tipoAmbito, direccion, telefono);
        return ent.registrarEmpresa(e);
    
    }
    
    public ArrayList<empresaDTO> consultarEmpresas(){
        
        empresaDAO dao = new empresaDAO();
        return dao.consultarEmpresa();
    }
    
}
