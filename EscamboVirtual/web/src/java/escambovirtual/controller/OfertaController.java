package escambovirtual.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Oferta;
import escambovirtual.model.entity.OfertaItem;
import escambovirtual.model.service.ItemService;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.springframework.http.converter.json.Jackson2ObjectMapperBuilder.json;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Joao
 */
@Controller
public class OfertaController {

    @RequestMapping(value = "/anunciante/item/{id}/ofertar", method = RequestMethod.GET)
    public ModelAndView getOfertarItem(@PathVariable Long id, HttpSession session) {
        ModelAndView mv;

        try {
            ItemService s = new ItemService();
            Item item = s.readById(id);
            if (item != null) {
                Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
                Map<Long, Object> criteria = new HashMap<>();
                criteria.put(ItemCriteria.ID_USUARIO, anunciante.getId());
                List<Item> itemList = new ArrayList<>();
                itemList = s.readByCriteria(criteria, null, null);
                mv = new ModelAndView("oferta/form-oferta");
                mv.addObject("itemReceptor", item);
                mv.addObject("anunciante", anunciante);
                mv.addObject("itemList", itemList);
            } else {
                mv = new ModelAndView("usuario/item-not-found");
                mv.addObject("erro", "Este item não foi encontrado em nosso DataBase!");
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }

    @RequestMapping(value = "/oferta/create/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void createOferta(@RequestBody String itens, @PathVariable Long id, HttpServletResponse response) {
        try {
//            Type type = new TypeToken<ArrayList<Item>>() {
//            }.getType();
            Gson gson = new Gson();
            TypeToken<List<Item>> token = new TypeToken<List<Item>>() {
            };
            List<Item> ofertaItens = gson.fromJson(itens, token.getType());
//            List<Item> ofertaItens = gson.fromJson(itens, type);
            Oferta oferta = new Oferta();
            ItemService s = new ItemService();
            Item item = s.readById(id);
            oferta.setItem(item);
            OfertaItem ofertaItem = new OfertaItem();
            ofertaItem.setItemList(ofertaItens);
            oferta.setOfertaItem(ofertaItem);
            response.setStatus(200);
        } catch (Exception e) {
            response.setStatus(500);
            e.printStackTrace();
        }
    }
    
    @RequestMapping(value = "/anunciante/oferta/list", method = RequestMethod.GET)
    public ModelAndView getOfertaList(HttpSession session){
        ModelAndView mv;
        try{
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            mv = new ModelAndView("oferta/list");
            mv.addObject("anunciante", anunciante);
        }catch(Exception e){
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }

}
