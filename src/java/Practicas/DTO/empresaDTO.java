package Practicas.DTO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrador
 */
public class empresaDTO {
    
    int id;
    String NIT;
    String sectorEmpresa;
    String representanteEmpresa;
    String nombreEmpresa;
    String tipoAmbito;
    String direccion;
    String telefono;
    int pais;

    public int getPais() {
        return pais;
    }

    public void setPais(int pais) {
        this.pais = pais;
    }
    //No le falta el constructor?
    public String getDireccion() {
        return direccion;
    }
    

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
  
   public String getNIT() {
        return NIT;
    }

    public void setNIT(String NIT) {
        this.NIT = NIT;
    }
    public empresaDTO() {
    }
//aqui esta... donde lo llama?
    public empresaDTO( String NIT, String sectorEmpresa, String nombreEmpresa, String tipoAmbito, String telefono, String direccion, int pais) {
        
        this.NIT=NIT;
        this.sectorEmpresa = sectorEmpresa;
        this.nombreEmpresa = nombreEmpresa;
        this.tipoAmbito = tipoAmbito;
        this.direccion=direccion;
        this.telefono=telefono;
        this.pais=pais;
    }

    
    public int getIdempresa() {
        return id;
    }

    public void setIdempresa(int id) {
        this.id = id;
    }

 

    public String getSectorEmpresa() {
        return sectorEmpresa;
    }

    public void setSectorEmpresa(String sectorEmpresa) {
        this.sectorEmpresa = sectorEmpresa;
    }

    public String getRepresentanteEmpresa() {
        return representanteEmpresa;
    }

    public void setRepresentanteEmpresa(String representanteEmpresa) {
        this.representanteEmpresa = representanteEmpresa;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getTipoAmbito() {
        return tipoAmbito;
    }

    public void setTipoAmbito(String tipoAmbito) {
        this.tipoAmbito = tipoAmbito;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "empresaDTO{" + "id=" + id + ", NIT=" + NIT + ", sectorEmpresa=" + sectorEmpresa + ", representanteEmpresa=" + representanteEmpresa + ", nombreEmpresa=" + nombreEmpresa + ", tipoAmbito=" + tipoAmbito + ", direccion=" + direccion + ", telefono=" + telefono + '}';
    }
    
    
    
    
}
