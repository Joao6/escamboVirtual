package escambovirtual.controller;

import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.SenhaService;
import escambovirtual.model.service.UsuarioService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Joao
 */
@Controller
public class IndexController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView goIndex(HttpSession session) throws Exception {        
        ModelAndView mv = new ModelAndView("/index");        
//        session.invalidate();        
        return mv;
    }    

    @RequestMapping(value = "/item/search", method = RequestMethod.GET)
    public ModelAndView search(String nomeCriterium) throws Exception{
        
        ItemService is = new ItemService();
        
        Map<Long, Object>itemCriteria = new HashMap<Long, Object>();
        String status = "Publicar";
        itemCriteria.put(ItemCriteria.NOME_ILIKE, nomeCriterium);
        itemCriteria.put(ItemCriteria.STATUS_EQ, status);
        List<Item> itemList = is.readByCriteria(itemCriteria);
        ModelAndView mv = new ModelAndView("pesquisa/list");
        mv.addObject("nomeCriterium", nomeCriterium);
        mv.addObject("itemList", itemList);
        return mv;
    }       
}
