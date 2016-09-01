package escambovirtual.model.service;

import escambovirtual.model.base.service.BaseSenhaService;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Joao
 */
public class SenhaService implements BaseSenhaService{
    
    @Override
    public String gerarSenhaAleatoria(){
        String[] carct = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

        String senha = "";

        for (int x = 0; x < 6; x++) {
            int j = (int) (Math.random() * carct.length);
            senha += carct[j];
        }        
        
        return senha;
    }
    
    @Override
    public String convertPasswordToMD5(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
 
        BigInteger hash = new BigInteger(1, md.digest(password.getBytes()));
 
        return String.format("%32x", hash);
    }
}
