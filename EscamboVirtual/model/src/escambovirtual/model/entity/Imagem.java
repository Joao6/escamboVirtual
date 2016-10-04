package escambovirtual.model.entity;

/**
 *
 * @author Joao
 */
public class Imagem {

    private String contentType;
    
    private byte[] conteudo;

    public byte[] getConteudo() {
        return conteudo;
    }

    public void setConteudo(byte[] conteudo) {
        this.conteudo = conteudo;
    }    

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }
}
