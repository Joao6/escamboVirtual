package escambovirtual.model.entity;

import escambovirtual.model.base.BaseEntity;

/**
 *
 * @author Joao
 */
public class Cidade extends BaseEntity {
    
    private String nome;
    private Estado estado;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
}
