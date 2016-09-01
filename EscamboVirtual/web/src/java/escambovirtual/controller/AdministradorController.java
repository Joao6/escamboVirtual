package escambovirtual.controller;

import escambovirtual.model.criteria.AdministradorCriteria;
import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Item;
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
public class AdministradorController {

    @RequestMapping(value = "/administrador/home", method = RequestMethod.GET)
    public ModelAndView homeAdministrador(HttpSession session) {
        Administrador adm = (Administrador)session.getAttribute("adm");
        ModelAndView mv = new ModelAndView("usuario/administrador/home");
        mv.addObject("adm", adm);
        return mv;
    }

    @RequestMapping(value = "/administrador/list", method = RequestMethod.GET)
    public ModelAndView getAvaliarItem() throws Exception {
        ModelAndView mv = new ModelAndView("usuario/administrador/item/list");
//        ItemService s = new ItemService();
//        List<Item> itemList = s.readByCriteria(null);
//        mv.addObject("itemList", itemList);
//        return mv;

        //ModelAndView mv = new ModelAndView("usuario/anunciante/item/list");
        
        ItemService s = new ItemService(); 
        
        //PROBLEMA COM PARA DE LOG
        //PRECISA SER MAPA DE STRING
        //SERÁ NECESÁRIO CRIAR ADMINISTRADOR DAO PROVAVELMENTE
        Map<Long, Object> criteria = new HashMap<>();
        String status = "Em Avaliação";
        criteria.put(ItemCriteria.STATUS_EQ, status);
        List<Item> itemList = s.readByCriteria(criteria);
        mv.addObject("itemList", itemList);
        return mv;
    }

    @RequestMapping(value = "/administrador/item/{id}/edit", method = RequestMethod.POST)
    public ModelAndView postItemAvaliacao(@PathVariable Long id, String status, HttpServletRequest request, HttpServletResponse response) throws Exception {
//        HttpSession session = request.getSession();
//        Long idUsuario = (Long) session.getAttribute("id");

        ItemService s = new ItemService();
        Item item = s.readById(id);
      
        item.setStatus(status);
        
        s.update(item);

        ModelAndView mv = new ModelAndView("redirect:/administrador/list");
        return mv;
    }
}
