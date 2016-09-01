package escambovirtual.controller;

import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Localizacao;
import escambovirtual.model.entity.Usuario;
import escambovirtual.model.service.AnuncianteService;
import escambovirtual.model.service.LocalizacaoService;
import escambovirtual.model.service.SenhaService;
import escambovirtual.model.service.UsuarioService;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
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

    @RequestMapping(value = "anunciante/perfil", method = RequestMethod.GET)
    public ModelAndView getAnunciantePerfil(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        LocalizacaoService sl = new LocalizacaoService();

        Anunciante anunciante = (Anunciante)session.getAttribute("anunciante");
        Localizacao localizacao = sl.readById(anunciante.getId());

        ModelAndView mv = new ModelAndView("usuario/anunciante/perfil");
        mv.addObject("anunciante", anunciante);
        mv.addObject("localizacao", localizacao);
        return mv;
    }

    @RequestMapping(value = "/anunciante/perfil", method = RequestMethod.POST)
    public ModelAndView postAnunciantePerfil(String nome, String apelido, String senha, String email, String sexo, String nascimento, Integer perfil, String telefone,
            String estado, String cidade, String bairro, String rua, String numero, String imagem, HttpServletRequest request,
            HttpServletResponse response, HttpSession session) throws Exception {

        AnuncianteService s = new AnuncianteService();
        
        Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");

        anunciante.setId(anunciante.getId());
        anunciante.setNome(nome);
        anunciante.setApelido(apelido);
        anunciante.setSenha(anunciante.getSenha());
        anunciante.setEmail(email);
        anunciante.setSexo(sexo);        
//        anunciante.setNascimento(nascimento);
        anunciante.setPerfil(perfil);
        anunciante.setTelefone(telefone);
//        anunciante.setImagem(imagem);
        s.update(anunciante);

        LocalizacaoService sl = new LocalizacaoService();
        Localizacao localizacao = new Localizacao();
//        localizacao.setEstado(estado);
//        localizacao.setCidade(cidade);
        localizacao.setBairro(bairro);
        localizacao.setRua(rua);
        localizacao.setNumero(numero);
        

        Localizacao localizacao2 = sl.readById(anunciante.getId());
        if (localizacao2 == null) {
            sl.create(localizacao);
        } else {
            localizacao.setId(anunciante.getId());
            sl.update(localizacao);
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
    public ModelAndView anuncianteHome(HttpSession session){
        Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
        ModelAndView mv = new ModelAndView("usuario/anunciante/home");
        mv.addObject("anunciante", anunciante);
        return mv;
    }

    @RequestMapping(value = "anunciante/alterarsenha", method = RequestMethod.GET)
    public ModelAndView getAnuncianteAlerarSenha(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        AnuncianteService s = new AnuncianteService();
        ModelAndView mv = new ModelAndView("usuario/anunciante/alterarsenha");
//        mv.addObject("anunciante", anunciante);
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
