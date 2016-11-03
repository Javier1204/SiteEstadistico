package practicas.DTO;

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
    
    int idempresa;
    int NIT;
    String sectorEmpresa;
    String representanteEmpresa;
    String nombreEmpresa;
    String tipoAmbito;
    String telefono;

    public empresaDTO() {
    }

    public empresaDTO(int NIT, String sectorEmpresa, String nombreEmpresa, String tipoAmbito) {
        this.NIT = NIT;
        this.sectorEmpresa = sectorEmpresa;
        this.nombreEmpresa = nombreEmpresa;
        this.tipoAmbito = tipoAmbito;
    }

    
    public int getIdempresa() {
        return idempresa;
    }

    public void setIdempresa(int idempresa) {
        this.idempresa = idempresa;
    }

    public int getNIT() {
        return NIT;
    }

    public void setNIT(int NIT) {
        this.NIT = NIT;
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
    
    
    
    
}
