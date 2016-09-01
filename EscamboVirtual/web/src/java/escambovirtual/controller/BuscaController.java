/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package escambovirtual.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Pedro
 */
@Controller
public class BuscaController {
    
    @RequestMapping (value = "/web/buscar", method = RequestMethod.GET)
    public ModelAndView getBuscar (String item) throws Exception{
        ModelAndView mv = new ModelAndView("/usuario/busca/buscaItem");
        mv.addObject("item", item);        
        return mv;
    }
    
    @RequestMapping (value = "/web/buscar", method = RequestMethod.POST)
    public ModelAndView postBuscar () throws Exception{
        ModelAndView mv = new ModelAndView("");
        
        return mv;
    }
}
