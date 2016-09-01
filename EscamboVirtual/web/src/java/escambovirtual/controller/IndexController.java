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
    public ModelAndView goIndex() throws Exception {        
        ModelAndView mv = new ModelAndView("/index");        
        return mv;
    }    

//    @RequestMapping(value = "/escamboVirtual/login", method = RequestMethod.POST)
//    public ModelAndView postLogin(String tipo, String email, String senha, HttpSession session) throws Exception {
//        UsuarioService s = new UsuarioService();
//        SenhaService ss = new SenhaService();
//        
//        String senhaMD5 = ss.convertPasswordToMD5(senha);
//        ModelAndView mv = new ModelAndView();
//
//        if (tipo.equals("0")) {
//            Administrador adm = new Administrador();
//            adm = (Administrador) s.login(email, senhaMD5, tipo);
//            if (adm != null) {
//                session.setAttribute("administrador", adm);
//                mv = new ModelAndView("redirect:/administrador/home");
//                mv.addObject("administrador", adm);
//            } else {
//                mv = new ModelAndView("redirect:/index");
//                mv.addObject("erro", 1);
//            }
//            return mv;
//        } else if (tipo.equals("1")) {
//            Anunciante anunciante = new Anunciante();
//            anunciante = (Anunciante) s.login(email, senhaMD5, tipo);
//            if (anunciante != null) {
//                session.setAttribute("anunciante", anunciante);
//                mv = new ModelAndView("redirect:/anunciante/home");
//                mv.addObject("anunciante", anunciante);
//            } else {
//                mv = new ModelAndView("redirect:/index");
//                mv.addObject("erro", 1);
//            }
//            return mv;
//        }
//
//        return mv;
//    }
    
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
