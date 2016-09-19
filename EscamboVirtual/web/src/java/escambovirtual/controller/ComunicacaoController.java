package escambovirtual.controller;

import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.service.ItemService;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Joao
 */
@Controller
public class ComunicacaoController {

    @RequestMapping(value = "/anunciante/comunicacao/item/{id}", method = RequestMethod.GET)
    public ModelAndView getEnviarMsg(@PathVariable Long id, HttpSession session) {
        ModelAndView mv;
        try {
            ItemService s = new ItemService();
            Item item = s.readById(id);
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            if (item != null) {
                mv = new ModelAndView("comunicacao/enviar-msg");
                mv.addObject("item", item);
                mv.addObject("anunciante", anunciante);
            } else {
                mv = new ModelAndView("usuario/item-not-found");
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }

        return mv;
    }
    
    @RequestMapping(value = "/anunciante/comunicacao/item/{id}", method = RequestMethod.POST)
    public ModelAndView postEnviarMsg(@PathVariable Long id, String mensagem){
        ModelAndView mv;
        try{
            ItemService s = new ItemService();
            Item item = s.readById(id);
            mv = new ModelAndView("mensagem/list");
        }catch(Exception e){
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }
}
