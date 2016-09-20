package escambovirtual.controller;

import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Usuario;
import escambovirtual.model.service.ItemService;
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

        List<Item> itemList = s.readByCriteria(criteria);

        ModelAndView mv = new ModelAndView("usuario/anunciante/item/list");
        mv.addObject("itemList", itemList);
        if (toast!=null && toast > 0) {
            mv.addObject("msg", ((Map<Long, String>) session.getAttribute("toasts")).get(toast));
            ((Map<Long, String>) session.getAttribute("toasts")).remove(toast);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/item/new", method = RequestMethod.GET)
    public ModelAndView getItemNew() throws Exception {
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/new");
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

    @RequestMapping(value = "/anunciante/item/{id}/del", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Long id, HttpSession session, HttpServletResponse response) {
        ModelAndView mv;
        try {
            Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
            ItemService s = new ItemService();
            Item item = s.readById(id);
            if (item.getAnunciante().getId() == usuario.getId()) {
                s.delete(id);
                mv = new ModelAndView("redirect:/anunciante/item");
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

    @RequestMapping(value = "/anunciante/pesquisar/item/{id}/view", method = RequestMethod.GET)
    public ModelAndView getItemView(@PathVariable Long id) throws Exception {
        ItemService s = new ItemService();
        Item item = s.readById(id);
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/view");
        mv.addObject("item", item);
        return mv;
    }
    
    @RequestMapping(value = "/anunciante/item/permissao-negada", method = RequestMethod.GET)
    public ModelAndView permissaoNegada() throws Exception {
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/permissao-negada");
        return mv;
    }
}
