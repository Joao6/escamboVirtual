package escambovirtual.model.entity;

import escambovirtual.model.base.BaseEntity;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joao
 */
public class Comunicacao extends BaseEntity{
    
    private List<Mensagem> mensagemList;
    private Item item;

    public Comunicacao() {
        mensagemList = new ArrayList<>();
    }    
    
    public List<Mensagem> getMensagemList() {
        return mensagemList;
    }

    public void setMensagemList(List<Mensagem> mensagemList) {
        this.mensagemList = mensagemList;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
    
    
}
