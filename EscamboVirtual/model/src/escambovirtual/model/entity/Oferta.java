package escambovirtual.model.entity;

import escambovirtual.model.base.BaseEntity;
import java.util.Date;

/**
 *
 * @author Joao
 */
public class Oferta extends BaseEntity {

    Date dataOferta;
    Item item;
    OfertaItem ofertaItem;

    public Date getDataOferta() {
        return dataOferta;
    }

    public void setDataOferta(Date dataOferta) {
        this.dataOferta = dataOferta;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public OfertaItem getOfertaItem() {
        return ofertaItem;
    }

    public void setOfertaItem(OfertaItem ofertaItem) {
        this.ofertaItem = ofertaItem;
    }        
}
