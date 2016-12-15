/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package integrador.Servicio;

import integrador.DAO.InformeDAO;
import integrador.DTO.InformeDTO;
import java.util.List;

/**
 *
 * @author carlos
 */
public class SrvInforme {
    private static SrvInforme instance;
    private InformeDAO daoInforme;
    
    protected SrvInforme(){
      this.daoInforme=new InformeDAO();
    }
    
    public static SrvInforme getInstance(){
      if(instance==null){
    instance=new SrvInforme();
    }
    return instance;
    }
    
    /**
    lista los informes
    **/
    public List<InformeDTO> listarPublicaciones(){
    return this.daoInforme.listarPublicaciones();
    }
    
    /**
     * lista los informes segun el modulo
     * @param modulo
     * @return 
     */
    public List<InformeDTO> listarPublicacionesModulo(String modulo,int ano,int semestre){
    return this.daoInforme.listarPublicacionesModulo(modulo,ano,semestre);
    }
    
}
