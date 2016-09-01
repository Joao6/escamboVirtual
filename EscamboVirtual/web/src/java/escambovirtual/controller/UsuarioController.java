package escambovirtual.controller;

import escambovirtual.model.criteria.UsuarioCriteria;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Usuario;
import escambovirtual.model.service.EmailService;
import escambovirtual.model.service.SenhaService;
import escambovirtual.model.service.UsuarioService;
import java.security.NoSuchAlgorithmException;
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
public class UsuarioController {

    @RequestMapping(value = "/usuario/login", method = RequestMethod.POST)
    public ModelAndView login(String email, String senha, HttpSession session) throws Exception {
        UsuarioService s = new UsuarioService();
        SenhaService ss = new SenhaService();
        String senhaMD5 = ss.convertPasswordToMD5(senha);

        ModelAndView mv;

        Usuario usuario = null;
        usuario = s.login(email, senhaMD5);
        if (usuario instanceof Administrador) {
            session.setAttribute("administrador", usuario);
            mv = new ModelAndView("redirect:/administrador/home");
            mv.addObject("administrador", usuario);
        } else if (usuario instanceof Anunciante) {
            session.setAttribute("anunciante", usuario);
            mv = new ModelAndView("redirect:/anunciante/home");
            mv.addObject("anunciante", usuario);
        } else {
            mv = new ModelAndView("redirect:/index");
            mv.addObject("erro", 1);
        }

        return mv;
    }

    @RequestMapping(value = "/sair", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) {
        ModelAndView mv = new ModelAndView("/../../index");
        session.invalidate();
        return mv;
    }
    
    @RequestMapping(value = "/usuario/recuperar-senha", method = RequestMethod.GET)
    public ModelAndView getRecuperarSenha(){
        ModelAndView mv = new ModelAndView("usuario/recuperarSenha");        
        return mv;
    }

    @RequestMapping(value = "/usuario/recuperar-senha", method = RequestMethod.POST)
    public ModelAndView recuperarSenha(String emailRecuperacao) throws Exception {
        ModelAndView mv;

        UsuarioService s = new UsuarioService();
        Usuario usuario = s.recuperarSenha(emailRecuperacao);
        
        if(usuario != null){
            mv = new ModelAndView("redirect:/index");
        }else{
            mv = new ModelAndView("redirect:/index");
            mv.addObject("erro", 1);
        }

        return mv;
    }
}
