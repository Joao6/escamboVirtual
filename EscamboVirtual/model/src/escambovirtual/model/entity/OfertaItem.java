package escambovirtual.model.entity;

import escambovirtual.model.base.BaseEntity;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joao
 */
public class OfertaItem extends BaseEntity{
    
    List<Item> itemList;
    String itemDescrito;
    
    public OfertaItem(){
        itemList = new ArrayList<>();
    }

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }

    public String getItemDescrito() {
        return itemDescrito;
    }

    public void setItemDescrito(String itemDescrito) {
        this.itemDescrito = itemDescrito;
    }
    
    
}
