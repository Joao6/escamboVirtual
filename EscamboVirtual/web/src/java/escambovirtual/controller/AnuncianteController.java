package escambovirtual.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import escambovirtual.constraints.AppConstraints;
import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.criteria.LocalizacaoCriteria;
import escambovirtual.model.criteria.OfertaCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Cidade;
import escambovirtual.model.entity.Estado;
import escambovirtual.model.entity.Imagem;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Localizacao;
import escambovirtual.model.entity.Oferta;
import escambovirtual.model.service.AnuncianteService;
import escambovirtual.model.service.CidadeService;
import escambovirtual.model.service.EstadoService;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.LocalizacaoService;
import escambovirtual.model.service.OfertaService;
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
import org.springframework.web.multipart.MultipartFile;
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
        List<Estado> estados = es.readByCriteria(null, null, null);
        Localizacao localizacao = null;
        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(LocalizacaoCriteria.USUARIO_EQ, anunciante.getId());
        List<Localizacao> localizacaoList = new ArrayList<>();
        localizacaoList = sl.readByCriteria(criteria, null, null);
        if (localizacaoList != null && localizacaoList.size() == 1) {
            localizacao = localizacaoList.get(0);
        }
        ModelAndView mv = new ModelAndView("usuario/anunciante/perfil");
        mv.addObject("anunciante", anunciante);
        mv.addObject("localizacao", localizacao);
        mv.addObject("estados", estados);
//        mv.addObject("cidade", localizacao.getCidade());
        return mv;
    }

    @RequestMapping(value = "/anunciante/perfil", method = RequestMethod.POST)
    public ModelAndView postAnunciantePerfil(String nome, String apelido, String senha, String email, String sexo, String nascimento, Long perfil, String telefone,
            Long estado, Long cidade, String bairro, String rua, String numero, HttpServletRequest request,
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
            localizacaoList = sl.readByCriteria(criteria, null, null);
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

    @RequestMapping(value = "/anunciante/imagem-perfil/alterar", method = RequestMethod.GET)
    public ModelAndView getAlterarImagem(HttpSession session) {
        ModelAndView mv = null;
        try {
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            mv = new ModelAndView("usuario/anunciante/img-perfil");
            mv.addObject("anunciante", anunciante);
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/imagem-perfil/alterar", method = RequestMethod.POST)
    public ModelAndView postAlterarImagem(MultipartFile file, HttpSession session) {
        ModelAndView mv = null;
        try {
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            //IMAGEM DO USUARIO
            Imagem imagem = new Imagem();
            imagem.setContentType(file.getContentType());
            imagem.setConteudo(file.getBytes());
            UsuarioService us = new UsuarioService();
            us.setImagem(anunciante.getId(), imagem);
            anunciante.setImagem(imagem);
            session.setAttribute("anunciante", anunciante);
            mv = new ModelAndView("redirect:/anunciante/perfil");
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/home", method = RequestMethod.GET)
    public ModelAndView anuncianteHome(HttpSession session) {
        ModelAndView mv = null;
        try {
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            ItemService s = new ItemService();
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(ItemCriteria.ID_USUARIO, anunciante.getId());
            Long countItem = s.countByCriteria(criteria, null, null);
            OfertaService os = new OfertaService();
            criteria = new HashMap<>();
            criteria.put(OfertaCriteria.ANUNCIANTE_ID, anunciante.getId());
            Long countOferta = os.countByCriteria(criteria, null, null);
            mv = new ModelAndView("usuario/anunciante/home");
            mv.addObject("anunciante", anunciante);
            mv.addObject("countItem", countItem);            
            mv.addObject("countOferta", countOferta);            
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }

        return mv;
    }

    @RequestMapping(value = "anunciante/alterarsenha", method = RequestMethod.GET)
    public ModelAndView getAnuncianteAlterarSenha(HttpSession session) throws Exception {
        Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
        ModelAndView mv = new ModelAndView("usuario/anunciante/alterarsenha");
        mv.addObject("anunciante", anunciante);
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
            mv.addObject("anunciante", anunciante);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/pesquisar/item", method = RequestMethod.GET)
    public ModelAndView getPesquisaItem(String nomeCriterium, HttpSession session, Long limit, Long offset) throws Exception {
        ModelAndView mv = null;
        try {
            if (limit != null && offset != null) {
                Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
                Map<Long, Object> criteria = new HashMap<>();
                criteria.put(ItemCriteria.NOME_ILIKE, nomeCriterium);
                criteria.put(ItemCriteria.STATUS_EQ, "Publicar");

                ItemService s = new ItemService();
                List<Item> itemList = s.readByCriteria(criteria, limit, offset);
                Long count = s.countByCriteria(criteria, limit, offset);
                mv = new ModelAndView("pesquisaOn/list");
                mv.addObject("itemList", itemList);
                mv.addObject("nomeCriterium", nomeCriterium);
                mv.addObject("anunciante", anunciante);
                mv.addObject("count", count);
                mv.addObject("limit", limit);
                mv.addObject("offset", offset);
            } else {
                String redirect = "redirect:/anunciante/pesquisar/item?";
                if (nomeCriterium != null) {
                    redirect += "nomeCriterium=" + nomeCriterium + "&";
                }

                if (limit == null) {
                    redirect += "limit=" + AppConstraints.LIMIT_LIST_PESQUISA_INTERNA + "&offset=0";
                }
                mv = new ModelAndView(redirect);
            }

        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }

        return mv;
    }

    @RequestMapping(value = "/anunciante/create/api", method = RequestMethod.POST)
    @ResponseBody
    public void create(@RequestBody String anunciante, HttpServletResponse response) {
        try {
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
            List<Item> itemList = s.readByCriteria(criteria, null, null);
            Gson g = new Gson();
            itens = g.toJson(itemList);

            response.setStatus(200);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
        }
        return itens;
    }
}
