package escambovirtual.model;

import escambovirtual.model.entity.Troca;
import escambovirtual.model.service.TrocaService;
import java.util.List;

/**
 *
 * @author Joao
 */
public class Main {

    public static void main(String[] args) throws Exception {
        
        /*
        *
        *   INSERÇÃO DE UM USUÁRIO ADM 
        *
        */
        
//        AdministradorService s = new AdministradorService();
//
//        Administrador administrador = new Administrador();        
//        administrador.setNome("Admin");
//        administrador.setApelido("Admin");
//        administrador.setEmail("admin@gmail.com");
//        SenhaService ss = new SenhaService();
//        String senhaMD5 = ss.convertPasswordToMD5("123");
//        administrador.setSenha(senhaMD5);
//        administrador.setPerfil(1L);
//        administrador.setSexo("Masculino");
//        administrador.setNascimento("10/10/1910");
//        administrador.setData_cadastro(new java.sql.Date(new java.util.Date().getTime()));
//        administrador.setTelefone("9898989898");
//        administrador.setCpf("989898989");
//        s.create(administrador);   

        TrocaService s = new TrocaService();
        List<Troca> trocaList = s.readByCriteria(null, null, null);
        
    }
}
