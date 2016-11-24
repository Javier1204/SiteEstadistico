/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DTO;

/**
 *
 * @author JAVIER
 */
public class Acta {
    
    int id;
    String url;
    int idconvenio;

    public Acta(){
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getIdconvenio() {
        return idconvenio;
    }

    public void setIdconvenio(int idconvenio) {
        this.idconvenio = idconvenio;
    }
        
    public Acta(int id, String url, int idconvenio) {
        this.id = id;
        this.url = url;
        this.idconvenio = idconvenio;
    }
    
    
    
}
