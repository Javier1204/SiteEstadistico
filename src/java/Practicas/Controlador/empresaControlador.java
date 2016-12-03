/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Controlador;
import Practicas.DAO.empresaDAO;
import Practicas.DTO.empresaDTO;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Usuario
 */
public class empresaControlador {
    
        
    
    public ArrayList<empresaDTO> consultar_Empresas(){
        
        empresaDAO dao = new empresaDAO();
        return dao.consultarEmpresa();
    }
    public String registrarEmpresas( empresaDTO p) throws SQLException {
                                    
        empresaDAO ent = new empresaDAO();
        return ent.registrarEmpresa(p);
    }
    
    public String editarEmpresas( empresaDTO p) throws SQLException {
                                    
        empresaDAO ent = new empresaDAO();
        return ent.editarEmpresa(p);
    }
    
    public String eliminarEmpresa(String nit) throws SQLException{
        empresaDAO ent= new empresaDAO();
        return ent.eliminarEmpresa(nit);
    }
    public empresaDTO buscarEmpresa(String nit) {
       empresaDAO dao = new empresaDAO();
       return dao.buscarEmpresa(nit);
    }
}
