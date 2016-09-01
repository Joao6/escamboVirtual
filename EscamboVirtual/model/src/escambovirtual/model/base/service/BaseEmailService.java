package escambovirtual.model.base.service;

/**
 *
 * @author Joao
 */
public interface BaseEmailService {
    
    public void sendEmail(String destino, String assunto, String texto) throws Exception;
    
}
