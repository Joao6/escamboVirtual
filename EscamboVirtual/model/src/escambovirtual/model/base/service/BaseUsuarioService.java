package escambovirtual.model.base.service;

import escambovirtual.model.entity.Imagem;
import escambovirtual.model.entity.Usuario;
import java.util.Map;

/**
 *
 * @author Joao
 */
public interface BaseUsuarioService{
    
    public Usuario login(String email, String senha) throws Exception;
    
    public Usuario recuperarSenha(String email) throws Exception;
    
    public Boolean checkEmailUsuario(String email) throws Exception;
    
    public Map<String, String> validarSenha(String senha, Usuario usuario) throws Exception;
    
    public void setImagem(Long id, Imagem imagem) throws Exception;
    
    public Imagem getImagem(Long id) throws Exception;
}
