package escambovirtual.interceptor;

import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Usuario;
import escambovirtual.model.service.AdministradorService;
import escambovirtual.model.service.AnuncianteService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Joao
 */
public class Interceptor implements HandlerInterceptor {
//    
//    @Autowired
//    private UsuarioService usuarioService;

    @Override
    public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object arg2, Exception arg3) throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse res, Object arg2, ModelAndView modelAndView) throws Exception {

        String url = req.getRequestURL().toString();
        
        if (url.endsWith("/anunciante/home") || url.endsWith("/administrador/home")) {
            if (req.getSession().getAttribute("usuarioSessao") != null) {
                String urlDesejada = (String) req.getSession().getAttribute("urlDesejada");
                if (urlDesejada != null) {
                    req.getSession().setAttribute("urlDesejada", null);
                    res.sendRedirect(urlDesejada);
                }
            }
        }

    }

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object arg2) throws Exception {

        String url = req.getRequestURL().toString();               
        
        if (url.contains("css") || url.contains("fonts") || url.contains("img") || url.contains("js") || url.contains("less") || url.contains("woff2")) {
            return true;
        }        

        if (url.endsWith("/web")) {
            if (req.getSession().getAttribute("usuarioSessao") == null) {
                res.sendRedirect("/web/index");
                return false;
            }
        }

        if (!url.endsWith("/web/index") && !url.endsWith("/usuario/login") && !url.endsWith("/anunciantes/novo") && !url.endsWith("item/search") && !url.endsWith("/anunciante/create/api") && !url.endsWith("/usuario/check/email") && !url.endsWith("/usuario/recuperar-senha") && !url.endsWith("/view")) {
            if (req.getSession().getAttribute("usuarioSessao") == null) {
                req.getSession().setAttribute("urlDesejada", url);
                res.sendRedirect("/web/index");
                return false;
            }
        }

        if (req.getSession().getAttribute("usuarioSessao") != null) {
            Usuario usuario = (Usuario) req.getSession().getAttribute("usuarioSessao");
            if(usuario instanceof Anunciante){
                AnuncianteService s = new AnuncianteService();
                s.readById(usuario.getId());
            }else if(usuario instanceof Administrador){
                AdministradorService s = new AdministradorService();
                s.readById(usuario.getId());
            }
            
            req.getSession().setAttribute("usuarioSessao", usuario);
            if (usuario.getPerfil() == Usuario.USUARIO_TIPO_ADMINISTRADOR) {
                if (url.contains("anunciante")) {
                    res.sendRedirect("/web/administrador/permissao-negada");
                    return false;
                }               
            }
            if (usuario.getPerfil() == Usuario.USUARIO_TIPO_ANUNCIANTE) {
                if (url.contains("administrador")) {
                    res.sendRedirect("/web/anunciante/permissao-negada");
                    return false;
                }
            }
        }
        return true;
    }

    
}
