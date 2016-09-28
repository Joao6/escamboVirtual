package escambovirtual.model;

import escambovirtual.model.entity.Administrador;
import escambovirtual.model.service.AdministradorService;
import escambovirtual.model.service.SenhaService;

/**
 *
 * @author Joao
 */
public class Main {

    public static void main(String[] args) throws Exception {

        /*
        *
        *   INSERÇÃO DE UM USUÁRIO ADM 
        *   CREDENCIAIS DESTE USUARIO ADM:
        *   EMAIL: admin@gmail.com
        *   SENHA: 123
        *
         */
        AdministradorService s = new AdministradorService();

        Administrador administrador = new Administrador();
        administrador.setNome("Admin");
        administrador.setApelido("Admin");
        administrador.setEmail("admin@gmail.com");
        SenhaService ss = new SenhaService();
        String senhaMD5 = ss.convertPasswordToMD5("123");
        administrador.setSenha(senhaMD5);
        administrador.setPerfil(1L);
        administrador.setSexo("Masculino");
        administrador.setNascimento("10/10/1910");
        administrador.setData_cadastro(new java.sql.Date(new java.util.Date().getTime()));
        administrador.setTelefone("9898989898");
        administrador.setCpf("989898989");
        s.create(administrador);

    }
}
