
/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/

package CargaAcademica.Fachada;

import CargaAcademica.Controlador.ControladorCargaAcademica;
import CargaAcademica.Controlador.controladorActAdministrativas;
import CargaAcademica.Controlador.controladorExtension;
import CargaAcademica.Controlador.controladorInvestigacion;
import CargaAcademica.DTO.carga_ActAdministrativasDTO;
import CargaAcademica.DTO.carga_extensionDTO;
import CargaAcademica.DTO.carga_investigacionDTO;
import java.util.ArrayList;

public class Fachada {
    
    
    public String habilitarSistema(String codigo,String ano, String periodo,String fechaCierre){
        ControladorCargaAcademica c = new ControladorCargaAcademica();
        return c.habilitarSistema(codigo,ano,periodo,fechaCierre);
    }
    
    public String darProrroga(String codigo,String fechaCierre){
        ControladorCargaAcademica c = new ControladorCargaAcademica();
        return c.darProrroga(codigo,fechaCierre);
    }
    
    public String actualizarInfoPersonal(String codigo,String cedula,String nombres,String apellidos,
           String estado,String nivel_estudio,String categoria,String tipo_vinculacion,String correo_institucional,
           String correo_personal,String titulo_pregrado,String celular,String anos_exp,String fecha_nac,String direccion_resi){
        ControladorCargaAcademica c = new ControladorCargaAcademica();
        return c.actualizarInfoPersonal(codigo,cedula,nombres,apellidos,estado,nivel_estudio,categoria,tipo_vinculacion,correo_institucional,correo_personal,titulo_pregrado,celular,anos_exp,fecha_nac,direccion_resi);
    }
	
	 /**
     * 
     * @param dto
     * @return 
     */
     public String registrarExtension(carga_extensionDTO dto){
         controladorExtension c=new controladorExtension();
         return c.registrarExtension(dto);
     }
     /**
      * 
      * @return 
      */
     public ArrayList<carga_extensionDTO> obtenerExtension(){
         controladorExtension c=new controladorExtension();
         return c.obtenerExtension();
    }
    /**
     * 
     * @param dto
     * @return 
     */
    public String registrarActAdministrativas(carga_ActAdministrativasDTO dto) {
        controladorActAdministrativas c=new controladorActAdministrativas();
        return c.registrarActAdministrativa(dto);
    
    }
    /**
     * 
     * @return 
     */
    public ArrayList<carga_ActAdministrativasDTO> obtenerActAdmi(){
         controladorActAdministrativas c=new controladorActAdministrativas();
         return c.listarActAdmi();
    }
    
    
    public String registrarInvestigacion(carga_investigacionDTO dto){
        controladorInvestigacion c=new controladorInvestigacion();
        return c.registrarInvestigacion(dto);
    }
    
    public ArrayList<carga_investigacionDTO> obtenerInvestigaciones(){
        controladorInvestigacion c=new controladorInvestigacion();
        return c.obtenerInvestigaciones();
    }
}
