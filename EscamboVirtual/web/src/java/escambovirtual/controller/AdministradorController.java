package escambovirtual.controller;

import escambovirtual.model.criteria.AdministradorCriteria;
import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Item;
import escambovirtual.model.service.AdministradorService;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.SenhaService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdministradorController {

    @RequestMapping(value = "/administrador/home", method = RequestMethod.GET)
    public ModelAndView homeAdministrador(HttpSession session) {
        Administrador adm = (Administrador)session.getAttribute("adm");
        ModelAndView mv = new ModelAndView("usuario/administrador/home");
        mv.addObject("adm", adm);
        return mv;
    }
    
    @RequestMapping(value = "/administrador/new", method = RequestMethod.GET)
    public ModelAndView getAdministradorNew(){
        ModelAndView mv = new ModelAndView("usuario/administrador/new");
        return mv;
    }
    
    @RequestMapping(value = "/administrador/new", method = RequestMethod.POST)
    public ModelAndView postAdministradorNew(String nome, String email, String apelido, String senha, String cpf, String nascimento, String telefone, String sexo) throws Exception{
        AdministradorService s = new AdministradorService();
        Administrador adm = new Administrador();
        adm.setNome(nome);
        adm.setEmail(email);
        SenhaService ss = new SenhaService();        
        adm.setSenha(ss.convertPasswordToMD5(senha));
        adm.setNascimento(nascimento);
        adm.setTelefone(telefone);
        adm.setPerfil(1);
        adm.setCpf(cpf);
        adm.setSexo(sexo);
        adm.setApelido(apelido);
        s.create(adm);
        ModelAndView mv = new ModelAndView("redirect:/administrador/home");
        return mv;
    }
    
    @RequestMapping(value = "/administrador/alterar-senha", method = RequestMethod.GET)
    public ModelAndView getAlterarSenha(){
        ModelAndView mv = new ModelAndView("usuario/administrador/alterarsenha");
        return mv;
    }
    
    @RequestMapping(value = "/administrador/alterar-senha", method = RequestMethod.POST) 
    public ModelAndView postAlterarSenha(String novasenha, HttpSession session)throws Exception{
        SenhaService ss = new SenhaService();        
        Administrador administrador = (Administrador)session.getAttribute("administrador");
        administrador.setSenha(ss.convertPasswordToMD5(novasenha));
        AdministradorService s = new AdministradorService();
        s.update(administrador);
        ModelAndView mv = new ModelAndView("redirect:/administrador/home");
        return mv;
    }

    @RequestMapping(value = "/administrador/list", method = RequestMethod.GET)
    public ModelAndView getAvaliarItem() throws Exception {
        ModelAndView mv = new ModelAndView("usuario/administrador/item/list");
        ItemService s = new ItemService(); 
        
        Map<Long, Object> criteria = new HashMap<>();
        String status = "Em Avaliação";
        criteria.put(ItemCriteria.STATUS_EQ, status);
        List<Item> itemList = s.readByCriteria(criteria);
        mv.addObject("itemList", itemList);
        return mv;
    }

    @RequestMapping(value = "/administrador/item/{id}/edit", method = RequestMethod.POST)
    public ModelAndView postItemAvaliacao(@PathVariable Long id, String status, HttpServletRequest request, HttpServletResponse response) throws Exception {

        ItemService s = new ItemService();
        Item item = s.readById(id);
      
        item.setStatus(status);
        
        s.update(item);

        ModelAndView mv = new ModelAndView("redirect:/administrador/list");
        return mv;
    }
}
