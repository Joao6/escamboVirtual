package escambovirtual.model;

import escambovirtual.model.criteria.UsuarioCriteria;
import escambovirtual.model.dao.UsuarioDAO;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Usuario;
import escambovirtual.model.service.AdministradorService;
import escambovirtual.model.service.SenhaService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class Main {

    public static void main(String[] args) throws Exception {

        UsuarioDAO dao = new UsuarioDAO();
        AdministradorService s = new AdministradorService();

        Administrador administrador = new Administrador();        
        administrador.setNome("Admin");
        administrador.setApelido("Admin");
        administrador.setEmail("admin@admin");
        SenhaService ss = new SenhaService();
        String senhaMD5 = ss.convertPasswordToMD5("123");
        administrador.setSenha(senhaMD5);
        administrador.setPerfil(1);
        administrador.setSexo("Masculino");
        //administrador.setNascimento(rs.getDate("data_nascimento"));
        administrador.setData_cadastro(new java.sql.Date(new java.util.Date().getTime()));
        administrador.setTelefone("9898989898");
        administrador.setCpf("989898989");
        s.create(administrador);                   
                

    }

}
