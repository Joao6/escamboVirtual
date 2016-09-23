package escambovirtual.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.org.glassfish.gmbal.ParameterNames;
import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.criteria.OfertaCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Oferta;
import escambovirtual.model.entity.OfertaItem;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.OfertaService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            Gson gson = new Gson();
            List<Long> itensID = gson.fromJson(itens, ArrayList.class);
            ItemService s = new ItemService();
            Map<Long, Object> criteria = new HashMap<>();
            String ids = "";

            int i = 0;
            while (i < itensID.size()) {
                if (i == (itensID.size() - 1)) {
                    ids += "" + itensID.get(i);
                } else {
                    ids += "" + itensID.get(i) + ",";
                }
                i++;
            }
            if (!ids.equals("") && ids != null) {
                criteria.put(ItemCriteria.ID_ITEM_IN, ids);
                List<Item> itemList = s.readByCriteria(criteria, null, null);
                Item item = s.readById(id);
                Oferta oferta = new Oferta();
                oferta.setItem(item);
                OfertaItem ofI = new OfertaItem();
                ofI.setItemList(itemList);
                OfertaService os = new OfertaService();
                oferta.setOfertaItem(ofI);
                os.create(oferta);
                response.setStatus(200);
            }else{
                response.setStatus(500);
            }
        } catch (Exception e) {
            response.setStatus(500);
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/anunciante/oferta/list", method = RequestMethod.GET)
    public ModelAndView getOfertaList(HttpSession session) {
        ModelAndView mv;
        try {
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            mv = new ModelAndView("oferta/list");
            OfertaService os = new OfertaService();
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(OfertaCriteria.ANUNCIANTE_ID, anunciante.getId());
            List<Oferta> ofertaList = os.readByCriteria(criteria, null, null);

            mv.addObject("ofertaList", ofertaList);
            mv.addObject("anunciante", anunciante);
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/oferta/{id}/view", method = RequestMethod.GET)
    public ModelAndView getOferta(@PathVariable Long id, HttpSession session) {
        ModelAndView mv = null;
        try {
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            OfertaService os = new OfertaService();
            Oferta oferta = os.readById(id);
            if (oferta != null) {
                if (oferta.getItem().getAnunciante().getId().equals(anunciante.getId())) {
                    Item item = oferta.getOfertaItem().getItemList().get(0);
                    mv = new ModelAndView("oferta/view");
                    mv.addObject("oferta", oferta);
                    mv.addObject("anunciante", anunciante);
                    mv.addObject("anuncianteOferta", item.getAnunciante());
                } else {
                    mv = new ModelAndView("oferta/oferta-permissao-negada");
                    mv.addObject("anunciante", anunciante);
                }
            } else {
                mv = new ModelAndView("oferta/oferta-not-found");
                mv.addObject("anunciante", anunciante);
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }

    @RequestMapping(value = "/anunciante/oferta/{ofertaId}/item/view/{itemId}", method = RequestMethod.GET)
    public ModelAndView verItemOferta(@PathVariable Long ofertaId, @PathVariable Long itemId, HttpSession session) {
        ModelAndView mv = null;
        try {
            Anunciante anunciante = (Anunciante) session.getAttribute("usuarioSessao");
            Boolean itemOk = false;
            OfertaService os = new OfertaService();
            Oferta oferta = os.readById(ofertaId);
            if (oferta != null) {
                if (oferta.getItem().getAnunciante().getId().equals(anunciante.getId())) {
                    List<Item> itemList = oferta.getOfertaItem().getItemList();
                    ItemService s = new ItemService();
                    Item item = s.readById(itemId);
                    for (Item aux : itemList) {
                        if (aux.getId().equals(item.getId())) {
                            itemOk = true;
                        }
                    }
                    if (itemOk == true) {
                        mv = new ModelAndView("oferta/view-item-oferta");
                        mv.addObject("oferta", oferta);
                        mv.addObject("item", item);
                        mv.addObject("anunciante", anunciante);
                    } else {
                        mv = new ModelAndView("oferta/item-not-found");
                        mv.addObject("anunciante", anunciante);
                    }
                } else {
                    mv = new ModelAndView("oferta/oferta-permissao-negada");
                    mv.addObject("anunciante", anunciante);
                }
            } else {
                mv = new ModelAndView("oferta/oferta-not-found");
                mv.addObject("anunciante", anunciante);
            }
        } catch (Exception e) {
            mv = new ModelAndView("error");
            mv.addObject("error", e);
        }
        return mv;
    }

}
