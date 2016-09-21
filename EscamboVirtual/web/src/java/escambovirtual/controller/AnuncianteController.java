package escambovirtual.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import escambovirtual.model.criteria.CidadeCriteria;
import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.criteria.LocalizacaoCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Cidade;
import escambovirtual.model.entity.Estado;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Localizacao;
import escambovirtual.model.entity.Usuario;
import escambovirtual.model.service.AnuncianteService;
import escambovirtual.model.service.CidadeService;
import escambovirtual.model.service.EstadoService;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.LocalizacaoService;
import escambovirtual.model.service.SenhaService;
import escambovirtual.model.service.UsuarioService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnuncianteController {

    @RequestMapping(value = "anunciantes/novo", method = RequestMethod.GET)
    public ModelAndView getCreateAnunciante() {
        ModelAndView mv = new ModelAndView("usuario/anunciante/new");
        return mv;
    }

    @RequestMapping(value = "anunciantes/novo", method = RequestMethod.POST)
    public ModelAndView postCreateAnunciante(String nome, String apelido, String email, String senha, String telefone, String nascimento, String sexo) {
        ModelAndView mv;
        try {
            Map<String, Object> fields = new HashMap<>();
            fields.put("email", email);
            AnuncianteService s = new AnuncianteService();
            Map<String, String> errors = s.validate(fields);

            if (errors.isEmpty()) {
                Anunciante anunciante = new Anunciante();
                anunciante.setNome(nome);
                anunciante.setApelido(apelido);
                anunciante.setEmail(email);

                SenhaService ss = new SenhaService();
                String senhaMD5 = ss.convertPasswordToMD5(senha);
                anunciante.setSenha(senhaMD5);
                anunciante.setPerfil(2L);
                anunciante.setNascimento(nascimento);
                anunciante.setTelefone(telefone);
                anunciante.setSexo(sexo);

                s.create(anunciante);
                mv = new ModelAndView("redirect:/index");
            } else {
                mv = new ModelAndView("usuario/anunciante/new");
                mv.addObject("errors", errors);
                mv.addObject("nome", nome);
                mv.addObject("email", email);
                mv.addObject("apelido", apelido);
                mv.addObject("telefone", telefone);
                mv.addObject("nascimento", nascimento);
                mv.addObject("sexo", sexo);
            }

        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }

        return mv;
    }

    @RequestMapping(value = "/anunciante/perfil", method = RequestMethod.GET)
    public ModelAndView getAnunciantePerfil(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        LocalizacaoService sl = new LocalizacaoService();

        Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
        EstadoService es = new EstadoService();
        List<Estado> estados = es.readByCriteria(null);
        Localizacao localizacao = null;
        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(LocalizacaoCriteria.USUARIO_EQ, anunciante.getId());
        List<Localizacao> localizacaoList = new ArrayList<>();
        localizacaoList = sl.readByCriteria(criteria);
        if (localizacaoList != null && localizacaoList.size() == 1) {
            localizacao = localizacaoList.get(0);
        }
        ModelAndView mv = new ModelAndView("usuario/anunciante/perfil");
        mv.addObject("anunciante", anunciante);
        mv.addObject("localizacao", localizacao);
        mv.addObject("estados", estados);
        return mv;
    }

    @RequestMapping(value = "/anunciante/perfil", method = RequestMethod.POST)
    public ModelAndView postAnunciantePerfil(String nome, String apelido, String senha, String email, String sexo, String nascimento, Long perfil, String telefone,
            Long estado, Long cidade, String bairro, String rua, String numero, String imagem, HttpServletRequest request,
            HttpServletResponse response, HttpSession session) {

        ModelAndView mv;
        try {
            AnuncianteService s = new AnuncianteService();

            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");

            anunciante.setNome(nome);
            anunciante.setApelido(apelido);
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

            session.setAttribute("usuarioSessao", anunciante);
            mv = new ModelAndView("redirect:/anunciante/perfil");
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }

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
        Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
        ModelAndView mv = new ModelAndView("usuario/anunciante/home");
        mv.addObject("anunciante", anunciante);
        return mv;
    }

    @RequestMapping(value = "anunciante/alterarsenha", method = RequestMethod.GET)
    public ModelAndView getAnuncianteAlterarSenha(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("usuario/anunciante/alterarsenha");
        return mv;
    }

    @RequestMapping(value = "anunciante/alterarsenha", method = RequestMethod.POST)
    public ModelAndView postAnuncianteAlterarSenha(String novasenha, String senhaatual, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        ModelAndView mv;
        AnuncianteService s = new AnuncianteService();
        Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
        SenhaService ss = new SenhaService();
        String passwordMD5 = ss.convertPasswordToMD5(novasenha);
        UsuarioService us = new UsuarioService();
        Map<String, String> errors = us.validarSenha(senhaatual, anunciante);
        if (errors.isEmpty()) {
            anunciante.setSenha(passwordMD5);
            s.update(anunciante);
            mv = new ModelAndView("redirect:/anunciante/home");
        } else {                        
            mv = new ModelAndView("usuario/anunciante/alterarsenha");
            mv.addObject("validSenha", errors);
        }        
        return mv;
    }

    @RequestMapping(value = "/anunciante/pesquisar/item", method = RequestMethod.GET)
    public ModelAndView getPesquisaItem(String nomeCriterium) throws Exception {
        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(ItemCriteria.NOME_ILIKE, nomeCriterium);
        criteria.put(ItemCriteria.STATUS_EQ, "Publicar");

        ItemService s = new ItemService();
        List<Item> itemList = s.readByCriteria(criteria);

        ModelAndView mv = new ModelAndView("pesquisaOn/list");
        mv.addObject("itemList", itemList);
        mv.addObject("nomeCriterium", nomeCriterium);
        return mv;
    }

    @RequestMapping(value = "/anunciante/create/api", method = RequestMethod.POST)
    @ResponseBody
    public void create(@RequestBody String anunciante, HttpServletResponse response) {
        try {
//            Type type = new TypeToken<Anunciante>(){                
//            }.getType();
//            Gson g = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
            Gson g = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();

            Anunciante anuncianteNew = g.fromJson(anunciante, Anunciante.class);
            Map<String, Object> fields = new HashMap<>();
            if (anuncianteNew != null) {
                AnuncianteService s = new AnuncianteService();
                anuncianteNew.setPerfil(2L);
                SenhaService ss = new SenhaService();
                anuncianteNew.setSenha(ss.convertPasswordToMD5(anuncianteNew.getSenha()));
                s.create(anuncianteNew);
                response.setStatus(200);
            }
        } catch (Exception e) {
            response.setStatus(500);
        }
    }

    @RequestMapping(value = "/itens/anunciante/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String getItensAnunciante(@PathVariable Long id, HttpServletResponse response) {
        String itens = null;
        Map<Long, Object> criteria = new HashMap<>();
        try {
            criteria.put(ItemCriteria.ID_USUARIO, id);
            ItemService s = new ItemService();
            List<Item> itemList = s.readByCriteria(criteria);
            Gson g = new Gson();
            itens = g.toJson(itemList);

            response.setStatus(200);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
        }
        return itens;
    }

    @RequestMapping(value = "/anunciante/cidades/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String getEstados(HttpServletResponse response, @PathVariable Long id) {
        List<Cidade> cidadeList = new ArrayList<>();
        String cidades = null;
        try {

            CidadeService cs = new CidadeService();
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(CidadeCriteria.ESTADO_FK, id);
            cidadeList = cs.readByCriteria(criteria);

            Gson g = new Gson();
            cidades = g.toJson(cidadeList);

            response.setStatus(200);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
        }
        return cidades;
    }

//    @RequestMapping(value = "/anunciante/validar-senha", method = RequestMethod.POST)
//    @ResponseBody
//    public Boolean validarSenha(String senha, HttpServletResponse response, HttpSession session) {
//        Boolean senhaOk = false;
//        try {
//            SenhaService ss = new SenhaService();
//            String senhaMD5 = ss.convertPasswordToMD5(senha);
//            Usuario usuario = (Usuario) session.getAttribute("usuarioSessao");
//            if(usuario != null){
//                if(usuario.getSenha().equals(senhaMD5)){
//                    senhaOk = true;
//                }else{
//                    senhaOk = false;
//                }
//            }
//            response.setStatus(200);
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.setStatus(500);
//        }
//        return senhaOk;
//    }
}
