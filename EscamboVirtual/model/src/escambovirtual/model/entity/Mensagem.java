package escambovirtual.model.entity;

import escambovirtual.model.base.BaseEntity;
import java.util.Date;

/**
 *
 * @author Joao
 */
public class Mensagem extends BaseEntity{
    
    private String texto;
    private Usuario usuario;
    private Date data_hora;

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Date getData_hora() {
        return data_hora;
    }

    public void setData_hora(Date data_hora) {
        this.data_hora = data_hora;
    }       
}
