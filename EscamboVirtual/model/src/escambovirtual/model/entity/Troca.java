package escambovirtual.model.entity;

import escambovirtual.model.base.BaseEntity;

/**
 *
 * @author Joao
 */
public class Troca extends BaseEntity{
    
    private Oferta oferta;    
    private String status;

    public Oferta getOferta() {
        return oferta;
    }

    public void setOferta(Oferta oferta) {
        this.oferta = oferta;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
