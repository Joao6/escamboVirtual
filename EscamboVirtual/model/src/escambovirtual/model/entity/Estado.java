package escambovirtual.model.entity;

import escambovirtual.model.base.BaseEntity;

/**
 *
 * @author Joao
 */
public class Estado extends BaseEntity{
    
    private String uf;
    private String nome;

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
}
