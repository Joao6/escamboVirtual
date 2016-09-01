package escambovirtual.controller;

import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.service.ItemService;
import java.util.Date;
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
    public ModelAndView getItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/list");
        
        ItemService s = new ItemService(); 
        
        HttpSession session = request.getSession();
        Long id = (Long) session.getAttribute("id");
        
        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(ItemCriteria.ID_USUARIO, id);

        List<Item> itemList = s.readByCriteria(criteria);
       
        mv.addObject("itemList", itemList);
        return mv;
    }

    @RequestMapping(value = "/anunciante/item/new", method = RequestMethod.GET)
    public ModelAndView getItemNew() throws Exception {
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/new");
        return mv;
    }

    @RequestMapping(value = "anunciante/item/new", method = RequestMethod.POST)
    public ModelAndView postItemNew(String nome, String dataAquisicao, String descricao, String interesse1, String interesse2, String interesse3,
                                    String imagem1, String imagem2, String imagem3, String imagem4, String imagem5, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Item item = new Item();

        HttpSession session = request.getSession();        
        String status = "Em Avaliação";
                
        Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
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

        ModelAndView mv = new ModelAndView("redirect:/anunciante/item");
        return mv;

    }

    @RequestMapping(value = "/anunciante/item/{id}/edit", method = RequestMethod.POST)
    public ModelAndView postItemEdit(@PathVariable Long id, String nome, String dataAquisicao, String status, String descricao, String interesse1, String interesse2, String interesse3, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Anunciante anunciante = (Anunciante)session.getAttribute("anunciante");
        Item itemSession = (Item) session.getAttribute("item");

        Item item = new Item();

        status = "Em Avaliação";

        item.setId(id);
        item.setNome(nome);
        item.setDataAquisicao(dataAquisicao);        
        item.setDataCadastro(itemSession.getDataCadastro());
        item.setStatus(status);
        item.setDescricao(descricao);
        item.setInteresse1(interesse1);
        item.setInteresse2(interesse2);
        item.setInteresse3(interesse3);
        item.setAnunciante(anunciante);
        

        ItemService s = new ItemService();
        s.update(item);

        ModelAndView mv = new ModelAndView("redirect:/anunciante/item");
        return mv;
    }

    @RequestMapping(value = "/anunciante/item/{id}/edit", method = RequestMethod.GET)
    public ModelAndView getItemEdit(@PathVariable Long id, HttpSession session) throws Exception {
        ItemService s = new ItemService();
        Item item = s.readById(id);
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/edit");
        mv.addObject("item", item);
        session.setAttribute("item", item);
        return mv;

    }

    @RequestMapping(value = "/anunciante/item/{id}/del", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Long id) throws Exception {
        ItemService s = new ItemService();
        s.delete(id);
        ModelAndView mv = new ModelAndView("redirect:/anunciante/item");
        return mv;
    }
}
