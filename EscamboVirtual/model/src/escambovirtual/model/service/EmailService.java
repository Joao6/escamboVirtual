package escambovirtual.model.service;

import escambovirtual.model.base.service.BaseEmailService;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Joao
 */
public class EmailService implements BaseEmailService {

    @Override
    public void sendEmail(String destino, String assunto, String texto) throws Exception{
        Email email = new SimpleEmail();
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(465);
        //email.setSmtpPort(587);
        email.setStartTLSRequired(true);        
        email.setAuthenticator(new DefaultAuthenticator("escambov@gmail.com", "escambo123"));
        email.setSSLOnConnect(true);
        email.setSubject(assunto);
        try {
            email.setFrom("escambov@gmail.com");
            email.setMsg(texto);
            email.addTo(destino);
            email.send();
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }

}
