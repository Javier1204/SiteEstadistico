package gruposinvestigacion.model.dto;
// Generated 18/11/2016 11:36:30 AM by Hibernate Tools 4.3.1

public class Producto  implements java.io.Serializable {


     private int codigoproducto;
     private Tipoproducto tipoproducto;
     private String informaciontecnica;

    public Producto() {
    }

    public Producto(int codigoproducto, Tipoproducto tipoproducto, String informaciontecnica) {
        this.codigoproducto = codigoproducto;
        this.tipoproducto = tipoproducto;
        this.informaciontecnica = informaciontecnica;
    }

    public int getCodigoproducto() {
        return this.codigoproducto;
    }
    
    public void setCodigoproducto(int codigoproducto) {
        this.codigoproducto = codigoproducto;
    }

    public String getInformaciontecnica() {
        return this.informaciontecnica;
    }
    
    public void setInformaciontecnica(String informaciontecnica) {
        this.informaciontecnica = informaciontecnica;
    }

    public Tipoproducto getTipoproducto() {
        return tipoproducto;
    }

    public void setTipoproducto(Tipoproducto tipoproducto) {
        this.tipoproducto = tipoproducto;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Producto other = (Producto) obj;
        if (this.codigoproducto != other.codigoproducto) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "InvestigacionProducto{" + "codigoproducto=" + codigoproducto + ", tipoproducto=" + tipoproducto + ", informaciontecnica=" + informaciontecnica + '}';
    }
}