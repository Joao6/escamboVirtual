package escambovirtual.controller;

import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.criteria.OfertaCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.ItemImagem;
import escambovirtual.model.entity.Oferta;
import escambovirtual.model.entity.PalavraChave;
import escambovirtual.model.entity.Usuario;
import escambovirtual.model.service.EmailService;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.OfertaService;
import escambovirtual.model.service.PalavraChaveService;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {

    @RequestMapping(value = "/anunciante/item", method = RequestMethod.GET)
    public ModelAndView getItem(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        ItemService s = new ItemService();

        Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");

        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(ItemCriteria.ID_USUARIO, usuario.getId());

        List<Item> itemList = s.readByCriteria(criteria, null, null);
        Long count = s.countByCriteria(criteria, null, null);

        ModelAndView mv = new ModelAndView("usuario/anunciante/item/list");
        mv.addObject("itemList", itemList);
        mv.addObject("anunciante", usuario);
        mv.addObject("count", count);
        return mv;
    }

    @RequestMapping(value = "/anunciante/item/new", method = RequestMethod.GET)
    public ModelAndView getItemNew(HttpSession session) throws Exception {
        Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
        PalavraChaveService s = new PalavraChaveService();
        Map<Long, Object> criteria = new HashMap<>();
        List<PalavraChave> palavraChaveList = s.readByCriteria(criteria, null, null);
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/new");
        mv.addObject("palavraChaveList", palavraChaveList);
        mv.addObject("anunciante", usuario);
        return mv;
    }

    @RequestMapping(value = "anunciante/item/new", method = RequestMethod.POST)
    public ModelAndView postItemNew(@ModelAttribute Item item, MultipartFile file1, MultipartFile file2, MultipartFile file3, MultipartFile file4, MultipartFile file5, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        ModelAndView mv;
        try {
            String status = "Em Avaliação";
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            item.setAnunciante(anunciante);
            item.setStatus(status);

            List<ItemImagem> itemImagemList = new ArrayList<ItemImagem>();
            ItemImagem itemImagem1 = new ItemImagem();
            itemImagem1.setContent(file1.getBytes());
            itemImagem1.setContentType(file1.getContentType());
            itemImagemList.add(itemImagem1);

            ItemImagem itemImagem2 = new ItemImagem();
            itemImagem2.setContent(file2.getBytes());
            itemImagem2.setContentType(file2.getContentType());
            itemImagemList.add(itemImagem2);

            ItemImagem itemImagem3 = new ItemImagem();
            itemImagem3.setContent(file3.getBytes());
            itemImagem3.setContentType(file3.getContentType());
            itemImagemList.add(itemImagem3);

            ItemImagem itemImagem4 = new ItemImagem();
            itemImagem4.setContent(file4.getBytes());
            itemImagem4.setContentType(file4.getContentType());
            itemImagemList.add(itemImagem4);

            ItemImagem itemImagem5 = new ItemImagem();
            itemImagem5.setContent(file5.getBytes());
            itemImagem5.setContentType(file5.getContentType());
            itemImagemList.add(itemImagem5);

            item.setItemImagemList(itemImagemList);

            ItemService s = new ItemService();
            s.create(item);
            response.setStatus(200);
            
            EmailService es = new EmailService();
            String assunto = "Novo item cadastrado!";
            String texto = "Olá, "+anunciante.getNome()+". O seu item acabou de ser cadastrado no sistema Escambo Virtual. Agora ele passará por uma avaliação para checar se está apto a ser publicado em nosso Sistema. Em breve você será notificado novamente sobre o status de seu item. Agradecemos a colaboração =)";
            es.sendEmail(anunciante.getEmail(), assunto, texto);
            mv = new ModelAndView("redirect:/anunciante/item");
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
            response.setStatus(500);
        }
        return mv;

    }

    @RequestMapping(value = "/anunciante/item/img/{hash}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<InputStreamResource> getItemImage(@PathVariable String hash, HttpSession session, HttpServletResponse response) throws Exception {        
        try {
            ItemService s = new ItemService();
            ItemImagem itemImagem = s.readImageByHash(hash);
            response.setStatus(200);

            return ResponseEntity.ok()
                    .contentLength(itemImagem.getContent().length)
                    .contentType(MediaType.parseMediaType(itemImagem.getContentType()))
                    .body(new InputStreamResource(new ByteArrayInputStream(itemImagem.getContent())));

        } catch (Exception e) {
            response.setStatus(500);
        }

        return null;
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
                mv.addObject("anunciante", usuario);
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

    @RequestMapping(value = "/anunciante/item/del", method = RequestMethod.POST)
    public ModelAndView delete(Long idItem, HttpSession session) {
        ModelAndView mv;
        try {
            Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
            ItemService s = new ItemService();
            Item item = s.readById(idItem);
            if (item.getAnunciante().getId() == usuario.getId()) {
                s.delete(idItem);
                mv = new ModelAndView("redirect:/anunciante/item");
//                response.setStatus(200);
            } else {
                mv = new ModelAndView("redirect:/anunciante/item/permissao-negada");
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
//            response.setStatus(500);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/pesquisar/item/{id}/view", method = RequestMethod.GET)
    public ModelAndView getItemView(@PathVariable Long id, HttpSession session) throws Exception {
        ModelAndView mv = null;
        try {
            Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
            ItemService s = new ItemService();
            Item item = s.readById(id);
            OfertaService os = new OfertaService();
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(OfertaCriteria.ITEM_ID, item.getId());
            List<Oferta> ofertaList = os.readByCriteria(criteria, null, null);
            if (item != null) {
                Boolean fezOferta = false;
                if (ofertaList != null) {
                    for (Oferta aux : ofertaList) {
                        for (Item itemAux : aux.getOfertaItem().getItemList()) {
                            if (itemAux.getAnunciante().getId().equals(usuario.getId())) {
                                fezOferta = true;
                            }
                        }
                    }
                }
                mv = new ModelAndView("usuario/anunciante/item/view");
                mv.addObject("item", item);
                mv.addObject("anunciante", usuario);
                mv.addObject("fezOferta", fezOferta);
            } else {
                mv = new ModelAndView("usuario/anunciante/item/item-not-found");
                mv.addObject("anunciante", usuario);
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }

        return mv;
    }

    @RequestMapping(value = "/anunciante/item/permissao-negada", method = RequestMethod.GET)
    public ModelAndView permissaoNegada(HttpSession session) throws Exception {
        Usuario usuario = (Anunciante) session.getAttribute("usuarioSessao");
        ModelAndView mv = new ModelAndView("usuario/anunciante/item/permissao-negada");
        mv.addObject("anunciante", usuario);
        return mv;
    }
}
