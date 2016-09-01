package escambovirtual.model.base.service;

import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Joao
 */
public interface BaseSenhaService {
    
    public String gerarSenhaAleatoria();
    
    public String convertPasswordToMD5(String password) throws NoSuchAlgorithmException;
}
