
package CargaAcademica.Controlador;

import CargaAcademica.DAO.DAOCargaAcademica;
/*
 * @author Victor
 */
public class ControladorCargaAcademica {

    public String habilitarSistema(String codigo,String ano, String periodo,String fechaCierre) {
        DAOCargaAcademica c=new DAOCargaAcademica();
        return c.habilitarSistema(codigo,ano,periodo,fechaCierre);
        
    }

    public String darProrroga(String codigo, String fechaCierre) {
         DAOCargaAcademica c=new DAOCargaAcademica();
         return c.darProrroga(codigo,fechaCierre);
    }
    
    public String actualizarInfoPersonal(String codigo,String cedula,String nombres,String apellidos,
           String estado,String nivel_estudio,String categoria,String tipo_vinculacion,String correo_institucional,
           String correo_personal,String titulo_pregrado,String celular,String anos_exp,String fecha_nac,String direccion_resi){
         DAOCargaAcademica c=new DAOCargaAcademica();
        return c.actualizarInfoPersonal(codigo,cedula,nombres,apellidos,estado,nivel_estudio,categoria,tipo_vinculacion,correo_institucional,correo_personal,titulo_pregrado,celular,anos_exp,fecha_nac,direccion_resi);
    }
}
