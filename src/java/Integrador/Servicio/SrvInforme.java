/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Integrador.Servicio;

import Integrador.DAO.InformeDAO;
import Integrador.DTO.InformeDTO;
import java.util.List;

/**
 *
 * @author carlos
 * esta es la clase servicio la cual es llamada por los script de jsp 
 * esta clase actua con el patron singleton, tiene como funcion llamar a los
 * DAOS respectivos para ejecutar la funcnion de listar los informes
 */
public class SrvInforme {
    
    private static SrvInforme instance;
    private InformeDAO daoInforme;
    
    protected SrvInforme(){
      this.daoInforme=new InformeDAO();
    }
    
    public SrvInforme getInstance(){
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
    public List<InformeDTO> listarPublicacionesModulo(String modulo){
    return this.daoInforme.listarPublicacionesModulo(modulo);
    }
    
    
}
