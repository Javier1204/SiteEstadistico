
/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/

package CargaAcademica.Fachada;

import CargaAcademica.Controlador.ControladorCargaAcademica;
import CargaAcademica.Controlador.controladorActAdministrativas;
import CargaAcademica.Controlador.controladorDocencia;
import CargaAcademica.Controlador.controladorExtension;
import CargaAcademica.Controlador.controladorInvestigacion;
import CargaAcademica.DAO.carga_otraDAO;
import CargaAcademica.DTO.carga_ActAdministrativasDTO;
import CargaAcademica.DTO.carga_extensionDTO;
import CargaAcademica.DTO.carga_grupoDTO;
import CargaAcademica.DTO.carga_investigacionDTO;
import CargaAcademica.DTO.carga_otraDTO;
import CargaAcademica.DTO.general_asignaturaDTO;
import CargaAcademica.DTO.observacionesDTO;
import java.lang.reflect.Array;
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
    public String registrarActAdministrativas(carga_ActAdministrativasDTO dto,String codigoDoc) {
        controladorActAdministrativas c=new controladorActAdministrativas();
        return c.registrarActAdministrativa(dto,codigoDoc);
    
    }
    /**
     * 
     * @return 
     */
    public ArrayList<carga_ActAdministrativasDTO> obtenerActAdmi(String codigoDoc){
         controladorActAdministrativas c=new controladorActAdministrativas();
         return c.listarActAdmi(codigoDoc);
    }
    
    
    public String registrarInvestigacion(carga_investigacionDTO dto,String codigoDoc){
        controladorInvestigacion c=new controladorInvestigacion();
        return c.registrarInvestigacion(dto,codigoDoc);
    }
    
    public ArrayList<carga_investigacionDTO> obtenerInvestigaciones(String codigoDoc){
        controladorInvestigacion c=new controladorInvestigacion();
        return c.obtenerInvestigaciones(codigoDoc);
    }
    
    public String registrarDocencia(carga_grupoDTO dto,String codigoDoc){
        controladorDocencia c=new controladorDocencia();
        return c.regitrarDocencia(dto,codigoDoc);
    }
    
    public ArrayList<general_asignaturaDTO> obtenerAsignaturas(){
        controladorDocencia c=new controladorDocencia();
        return c.obtenerAsignaturas();
        
    }
    
    public String registrarObservacion(observacionesDTO dto){
        controladorDocencia c=new controladorDocencia();
        return c.registrarObservacion(dto);
    
    }
    
    public String registrarOtrasActividades(carga_otraDTO dto,String codigoDoc){
        carga_otraDAO dao=new carga_otraDAO();
        return dao.registrarOtrasActividades(dto,codigoDoc);
    }
    
    public ArrayList<carga_otraDTO> obtenerOtrasActividades(String codigoDoc){
        carga_otraDAO dao=new carga_otraDAO();
        return dao.obtenerOtrasActividades(codigoDoc);
    }
    
}
