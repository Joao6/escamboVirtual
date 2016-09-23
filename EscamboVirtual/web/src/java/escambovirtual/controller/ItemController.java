package escambovirtual.controller;

import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.criteria.OfertaCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Oferta;
import escambovirtual.model.entity.PalavraChave;
import escambovirtual.model.entity.Usuario;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.OfertaService;
import escambovirtual.model.service.PalavraChaveService;
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
public class ItemController {

    @RequestMapping(value = "/anunciante/item", method = RequestMethod.GET)
    public ModelAndView getItem(Long toast, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        ItemService s = new ItemService();

        Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");

        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(ItemCriteria.ID_USUARIO, usuario.getId());

        List<Item> itemList = s.readByCriteria(criteria, null, null);

        ModelAndView mv = new ModelAndView("usuario/anunciante/item/list");
        mv.addObject("itemList", itemList);
        mv.addObject("anunciante", usuario);
        if (toast != null && toast > 0) {
            mv.addObject("msg", ((Map<Long, String>) session.getAttribute("toasts")).get(toast));
            ((Map<Long, String>) session.getAttribute("toasts")).remove(toast);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/item/new", method = RequestMethod.GET)
    public ModelAndView getItemNew(HttpSession session) throws Exception {
        Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
        PalavraChaveService s = new PalavraChaveService();
        Map<Long, Object> criteria = new HashMap<>();
        List<PalavraChave> palavraChaveList = s.readByCriteria(criteria, null, null);
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/new");
        mv.addObject("palavraChaveList", palavraChaveList);
        mv.addObject("anunciante", usuario);
        return mv;
    }

    @RequestMapping(value = "anunciante/item/new", method = RequestMethod.POST)
    public ModelAndView postItemNew(String nome, String dataAquisicao, String descricao, String interesse1, String interesse2, String interesse3,
            String imagem1, String imagem2, String imagem3, String imagem4, String imagem5, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        ModelAndView mv;
        try {
            Item item = new Item();

            String status = "Em Avaliação";

            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            item.setAnunciante(anunciante);
            item.setNome(nome);
            item.setDataAquisicao(dataAquisicao);
            item.setStatus(status);
            item.setDescricao(descricao);
            item.setInteresse1(interesse1);
            item.setInteresse2(interesse2);
            item.setInteresse3(interesse3);
            ItemService s = new ItemService();
            s.create(item);
            response.setStatus(200);

            mv = new ModelAndView("redirect:/anunciante/item");
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
            response.setStatus(500);
        }
        return mv;

    }

    @RequestMapping(value = "/anunciante/item/{id}/edit", method = RequestMethod.GET)
    public ModelAndView getItemEdit(@PathVariable Long id, HttpSession session, HttpServletResponse response) throws Exception {
        ModelAndView mv;
        try {
            Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
            ItemService s = new ItemService();
            Item item = s.readById(id);
            if (item.getAnunciante().getId() == usuario.getId()) {
                mv = new ModelAndView("usuario/anunciante/item/edit");
                mv.addObject("item", item);
                mv.addObject("anunciante", usuario);
                response.setStatus(200);
            } else {
                mv = new ModelAndView("redirect:/anunciante/item/permissao-negada");
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
            response.setStatus(500);
        }

        return mv;
    }

    @RequestMapping(value = "/anunciante/item/{id}/edit", method = RequestMethod.POST)
    public ModelAndView postItemEdit(@PathVariable Long id, String nome, String dataAquisicao, String status, String descricao, String interesse1, String interesse2, String interesse3, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        ModelAndView mv;
        try {
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");

            ItemService s = new ItemService();
            Item item = s.readById(id);

            status = "Em Avaliação";

            item.setNome(nome);
            item.setDataAquisicao(dataAquisicao);
//        item.setDataCadastro(itemSession.getDataCadastro());
            item.setStatus(status);
            item.setDescricao(descricao);
            item.setInteresse1(interesse1);
            item.setInteresse2(interesse2);
            item.setInteresse3(interesse3);
            item.setAnunciante(anunciante);

            s.update(item);
            mv = new ModelAndView("redirect:/anunciante/item");
            response.setStatus(200);
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
            response.setStatus(500);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/item/del", method = RequestMethod.POST)
    public ModelAndView delete(Long idItem, HttpSession session) {
        ModelAndView mv;
        try {
            Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
            ItemService s = new ItemService();
            Item item = s.readById(idItem);
            if (item.getAnunciante().getId() == usuario.getId()) {
                s.delete(idItem);
                mv = new ModelAndView("redirect:/anunciante/item");
//                response.setStatus(200);
            } else {
                mv = new ModelAndView("redirect:/anunciante/item/permissao-negada");
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
//            response.setStatus(500);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/pesquisar/item/{id}/view", method = RequestMethod.GET)
    public ModelAndView getItemView(@PathVariable Long id, HttpSession session) throws Exception {
        ModelAndView mv = null;
        try {
            Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
            ItemService s = new ItemService();
            Item item = s.readById(id);
            OfertaService os = new OfertaService();
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(OfertaCriteria.ITEM_ID, item.getId());
            List<Oferta> ofertaList = os.readByCriteria(criteria, null, null);
            if (item != null) {
                Boolean fezOferta = false;
                if (ofertaList != null) {
                    for (Oferta aux : ofertaList) {
                        for (Item itemAux : aux.getOfertaItem().getItemList()) {
                            if (itemAux.getAnunciante().getId().equals(usuario.getId())) {
                                fezOferta = true;
                            }
                        }
                    }
                }
                mv = new ModelAndView("usuario/anunciante/item/view");
                mv.addObject("item", item);
                mv.addObject("anunciante", usuario);
                mv.addObject("fezOferta",fezOferta);
            } else {
                mv = new ModelAndView("usuario/anunciante/item/item-not-found");
                mv.addObject("anunciante", usuario);
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }

        return mv;
    }

    @RequestMapping(value = "/anunciante/item/permissao-negada", method = RequestMethod.GET)
    public ModelAndView permissaoNegada(HttpSession session) throws Exception {
        Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/permissao-negada");
        mv.addObject("anunciante", usuario);
        return mv;
    }
}
