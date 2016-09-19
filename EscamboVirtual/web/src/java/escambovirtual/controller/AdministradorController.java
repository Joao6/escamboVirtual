package escambovirtual.controller;

import escambovirtual.model.criteria.AdministradorCriteria;
import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.criteria.LocalizacaoCriteria;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Cidade;
import escambovirtual.model.entity.Estado;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Localizacao;
import escambovirtual.model.service.AdministradorService;
import escambovirtual.model.service.CidadeService;
import escambovirtual.model.service.EstadoService;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.LocalizacaoService;
import escambovirtual.model.service.SenhaService;
import java.util.ArrayList;
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
        Administrador adm = (Administrador) session.getAttribute("usuarioSessao");
        ModelAndView mv = new ModelAndView("usuario/administrador/home");
        mv.addObject("adm", adm);
        return mv;
    }

    @RequestMapping(value = "/administrador/new", method = RequestMethod.GET)
    public ModelAndView getAdministradorNew() {
        ModelAndView mv = new ModelAndView("usuario/administrador/new");
        return mv;
    }

    @RequestMapping(value = "/administrador/new", method = RequestMethod.POST)
    public ModelAndView postAdministradorNew(String nome, String email, String apelido, String senha, String cpf, String nascimento, String telefone, String sexo, HttpServletResponse response) {
        ModelAndView mv;
        try {
            AdministradorService s = new AdministradorService();
            Administrador adm = new Administrador();
            adm.setNome(nome);
            adm.setEmail(email);
            SenhaService ss = new SenhaService();
            adm.setSenha(ss.convertPasswordToMD5(senha));
            adm.setNascimento(nascimento);
            adm.setTelefone(telefone);
            adm.setPerfil(1L);
            adm.setCpf(cpf);
            adm.setSexo(sexo);
            adm.setApelido(apelido);
            s.create(adm);
            mv = new ModelAndView("redirect:/administrador/home");
            response.setStatus(200);
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
            response.setStatus(500);
        }

        return mv;
    }

    @RequestMapping(value = "/administrador/alterar-senha", method = RequestMethod.GET)
    public ModelAndView getAlterarSenha() {
        ModelAndView mv = new ModelAndView("usuario/administrador/alterarsenha");
        return mv;
    }

    @RequestMapping(value = "/administrador/alterar-senha", method = RequestMethod.POST)
    public ModelAndView postAlterarSenha(String novasenha, HttpSession session) throws Exception {
        SenhaService ss = new SenhaService();
        Administrador administrador = (Administrador) session.getAttribute("usuarioSessao");
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

    @RequestMapping(value = "/administrador/perfil", method = RequestMethod.GET)
    public ModelAndView getAdmPerfil(HttpSession session) {
        ModelAndView mv;
        try {
            Administrador adm = (Administrador) session.getAttribute("usuarioSessao");
            Localizacao localizacao = null;
            LocalizacaoService localizacaoService = new LocalizacaoService();
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(LocalizacaoCriteria.USUARIO_EQ, adm.getId());
            List<Localizacao> localizacaoList = localizacaoService.readByCriteria(criteria);
            if (localizacaoList != null && localizacaoList.size() == 1) {
                localizacao = localizacaoList.get(0);
            }
            mv = new ModelAndView("usuario/administrador/perfil");
            mv.addObject("administrador", adm);
            mv.addObject("localizacao", localizacao);
        } catch (Exception e) {
            mv = new ModelAndView("usuario/administrador/perfil");
            mv.addObject("error", e);
        }
        return mv;
    }

    @RequestMapping(value = "/administrador/perfil", method = RequestMethod.POST)
    public ModelAndView postAdmPerfil(HttpSession session, String nome, String apelido, String senha, String email, String sexo, String nascimento, Long perfil, String telefone,
            Long estado, Long cidade, String bairro, String rua, String numero, String imagem) {

        ModelAndView mv;
        try {
            Administrador adm = (Administrador) session.getAttribute("usuarioSessao");

            adm.setNome(nome);
            adm.setApelido(apelido);
            adm.setEmail(email);
            adm.setSexo(sexo);
            adm.setNascimento(nascimento);
            adm.setPerfil(perfil);
            adm.setTelefone(telefone);
//        adm.setImagem(imagem);
            AdministradorService s = new AdministradorService();
            s.update(adm);

            //TRATANDO A LOCALIZACAO DO ADMIN
            LocalizacaoService sl = new LocalizacaoService();
            Localizacao localizacao = new Localizacao();
            EstadoService es = new EstadoService();
            Estado estadoEntity = es.readById(estado);
            localizacao.setEstado(estadoEntity);
            CidadeService cs = new CidadeService();
            Cidade cidadeEntity = cs.readById(cidade);
            localizacao.setCidade(cidadeEntity);
            localizacao.setBairro(bairro);
            localizacao.setRua(rua);
            localizacao.setNumero(numero);
            localizacao.setUsuario(adm);

            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(LocalizacaoCriteria.USUARIO_EQ, adm.getId());
            List<Localizacao> localizacaoList = new ArrayList<>();
            localizacaoList = sl.readByCriteria(criteria);
            if (localizacaoList != null && localizacaoList.size() == 1) {
                Localizacao aux = localizacaoList.get(0);
                localizacao.setId(aux.getId());
                sl.update(localizacao);
            } else {
                sl.create(localizacao);
            }

            session.setAttribute("usuarioSessao", adm);
            mv = new ModelAndView("redirect:/administrador/perfil");
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }
}
