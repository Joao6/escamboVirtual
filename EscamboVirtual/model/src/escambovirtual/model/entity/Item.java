package escambovirtual.model.entity;

import escambovirtual.model.base.BaseEntity;
import java.util.List;

/**
 *
 * @author Joao
 */
public class Item extends BaseEntity {

    private String nome;
    private String dataAquisicao;
    private String status;
    private String descricao;
    private Anunciante anunciante;
    private String dataCadastro;
    private List<PalavraChave> palavraChave;
    private String interesse1;
    private String interesse2;
    private String interesse3;
    private List<ItemImagem> itemImagemList;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDataAquisicao() {
        return dataAquisicao;
    }

    public void setDataAquisicao(String dataAquisicao) {
        this.dataAquisicao = dataAquisicao;
    }

    public Anunciante getAnunciante() {
        return anunciante;
    }

    public void setAnunciante(Anunciante anunciante) {
        this.anunciante = anunciante;
    }

    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public List<PalavraChave> getPalavraChave() {
        return palavraChave;
    }

    public void setPalavraChave(List<PalavraChave> palavraChave) {
        this.palavraChave = palavraChave;
    }

    public String getInteresse1() {
        return interesse1;
    }

    public void setInteresse1(String interesse1) {
        this.interesse1 = interesse1;
    }

    public String getInteresse2() {
        return interesse2;
    }

    public void setInteresse2(String interesse2) {
        this.interesse2 = interesse2;
    }

    public String getInteresse3() {
        return interesse3;
    }

    public void setInteresse3(String interesse3) {
        this.interesse3 = interesse3;
    }

    public List<ItemImagem> getItemImagemList() {
        return itemImagemList;
    }

    public void setItemImagemList(List<ItemImagem> itemImagemList) {
        this.itemImagemList = itemImagemList;
    }

}
