package escambovirtual.model.base.service;

import escambovirtual.model.base.BaseCRUDService;
import escambovirtual.model.entity.Usuario;

/**
 *
 * @author Joao
 */
public interface BaseUsuarioService{
    
    public Usuario login(String email, String senha) throws Exception;
    
    public Usuario recuperarSenha(String email) throws Exception;
    
    public Boolean checkEmailUsuario(String email) throws Exception;
}
