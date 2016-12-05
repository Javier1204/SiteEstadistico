/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dao;
import gruposinvestigacion.model.dto.InvestigacionAliados;
import java.io.Serializable;
import java.util.List;


/**
 *
 * @author Administrator
 */
public class AliadoDAO implements Serializable{
    
    public InvestigacionAliados validarLogin(String codigo, String contrasena){
        
        InvestigacionAliados integrante = null;
        
        
        return integrante;
    }
    
    public List<InvestigacionAliados> listarInvestigacionAliadoss(){
        
        List<InvestigacionAliados> integrantes = null;
        
        
        return integrantes;
    }
    

    
    public boolean modificarInvestigacionAliados(InvestigacionAliados integrante) {

        
        return true;
    }
}
