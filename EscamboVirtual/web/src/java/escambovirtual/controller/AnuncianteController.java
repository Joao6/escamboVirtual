package escambovirtual.controller;

import escambovirtual.model.criteria.LocalizacaoCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Cidade;
import escambovirtual.model.entity.Estado;
import escambovirtual.model.entity.Localizacao;
import escambovirtual.model.service.AnuncianteService;
import escambovirtual.model.service.CidadeService;
import escambovirtual.model.service.EstadoService;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnuncianteController {

    @RequestMapping(value = "anunciantes/novo", method = RequestMethod.GET)
    public ModelAndView getCreateAnunciante() {
        ModelAndView mv = new ModelAndView("usuario/anunciante/new");
        return mv;
    }

    @RequestMapping(value = "anunciantes/novo", method = RequestMethod.POST)
    public ModelAndView postCreateAnunciante(String nome, String apelido, String email, String senha, String cidade, String uf, String telefone, String nascimento, String sexo) throws Exception {
        Anunciante anunciante = new Anunciante();
        anunciante.setNome(nome);
        anunciante.setApelido(apelido);
        anunciante.setEmail(email);

        SenhaService ss = new SenhaService();
        String senhaMD5 = ss.convertPasswordToMD5(senha);
        anunciante.setSenha(senhaMD5);
        anunciante.setPerfil(2);
        anunciante.setNascimento(nascimento);
        anunciante.setTelefone(telefone);
        anunciante.setSexo(sexo);

        AnuncianteService s = new AnuncianteService();
        s.create(anunciante);

        ModelAndView mv = new ModelAndView("redirect:/index");
        return mv;
    }

    @RequestMapping(value = "/anunciante/perfil", method = RequestMethod.GET)
    public ModelAndView getAnunciantePerfil(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        LocalizacaoService sl = new LocalizacaoService();

        Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
        Localizacao localizacao = null;
        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(LocalizacaoCriteria.USUARIO_EQ, anunciante.getId());
        List<Localizacao> localizacaoList = new ArrayList<>();
        localizacaoList = sl.readByCriteria(criteria);
        if(localizacaoList != null && localizacaoList.size() == 1){
            localizacao = localizacaoList.get(0);
        }
        ModelAndView mv = new ModelAndView("usuario/anunciante/perfil");
        mv.addObject("anunciante", anunciante);
        mv.addObject("localizacao", localizacao);
        return mv;
    }

    @RequestMapping(value = "/anunciante/perfil", method = RequestMethod.POST)
    public ModelAndView postAnunciantePerfil(String nome, String apelido, String senha, String email, String sexo, String nascimento, Integer perfil, String telefone,
            Long estado, Long cidade, String bairro, String rua, String numero, String imagem, HttpServletRequest request,
            HttpServletResponse response, HttpSession session) throws Exception {

        AnuncianteService s = new AnuncianteService();

        Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");

        anunciante.setId(anunciante.getId());
        anunciante.setNome(nome);
        anunciante.setApelido(apelido);
        anunciante.setSenha(anunciante.getSenha());
        anunciante.setEmail(email);
        anunciante.setSexo(sexo);
        anunciante.setNascimento(nascimento);
        anunciante.setPerfil(perfil);
        anunciante.setTelefone(telefone);
//        anunciante.setImagem(imagem);
        s.update(anunciante);

        //TRATANDO A LOCALIZACAO DO ANUNCIANTE
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
        localizacao.setUsuario(anunciante);
        
        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(LocalizacaoCriteria.USUARIO_EQ, anunciante.getId());
        List<Localizacao> localizacaoList = new ArrayList<>();
        localizacaoList = sl.readByCriteria(criteria);
        if (localizacaoList != null && localizacaoList.size() == 1) {
            Localizacao aux = localizacaoList.get(0);
            localizacao.setId(aux.getId());
            sl.update(localizacao);
        } else {
            sl.create(localizacao);
        }
                
        session.setAttribute("anunciante", anunciante);        
        ModelAndView mv = new ModelAndView("redirect:/anunciante/perfil");
        return mv;
    }

    @RequestMapping(value = "anunciantes", method = RequestMethod.GET)
    public ModelAndView postAnunciantes() throws Exception {
        ModelAndView mv = new ModelAndView("usuario/anunciante/list");
        AnuncianteService s = new AnuncianteService();
        List<Anunciante> anuncianteList = s.readByCriteria(null);

        mv.addObject("anuncianteList", anuncianteList);
        return mv;
    }

    @RequestMapping(value = "/anunciante/home", method = RequestMethod.GET)
    public ModelAndView anuncianteHome(HttpSession session) {
        Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
        ModelAndView mv = new ModelAndView("usuario/anunciante/home");
        mv.addObject("anunciante", anunciante);
        return mv;
    }

    @RequestMapping(value = "anunciante/alterarsenha", method = RequestMethod.GET)
    public ModelAndView getAnuncianteAlerarSenha(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("usuario/anunciante/alterarsenha");
        return mv;
    }

    @RequestMapping(value = "anunciante/alterarsenha", method = RequestMethod.POST)
    public ModelAndView postAnuncianteAlterarSenha(String novasenha, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        AnuncianteService s = new AnuncianteService();
        Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
        SenhaService ss = new SenhaService();
        String passwordMD5 = ss.convertPasswordToMD5(novasenha);
        anunciante.setSenha(passwordMD5);
        s.update(anunciante);

        ModelAndView mv = new ModelAndView("redirect:/anunciante/home");
        return mv;
    }
}
