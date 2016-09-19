package escambovirtual.model;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Oferta;
import escambovirtual.model.entity.OfertaItem;
import escambovirtual.model.service.ItemService;
import escambovirtual.model.service.OfertaService;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joao
 */
public class Main {

    public static void main(String[] args) throws Exception {

//        UsuarioDAO dao = new UsuarioDAO();
//        AdministradorService s = new AdministradorService();
//
//        Administrador administrador = new Administrador();        
//        administrador.setNome("Admin");
//        administrador.setApelido("Admin");
//        administrador.setEmail("admin@admin");
//        SenhaService ss = new SenhaService();
//        String senhaMD5 = ss.convertPasswordToMD5("123");
//        administrador.setSenha(senhaMD5);
//        administrador.setPerfil(1L);
//        administrador.setSexo("Masculino");
//        //administrador.setNascimento(rs.getDate("data_nascimento"));
//        administrador.setData_cadastro(new java.sql.Date(new java.util.Date().getTime()));
//        administrador.setTelefone("9898989898");
//        administrador.setCpf("989898989");
//        s.create(administrador);   
//        String result;
//        String email = "joaopedro.dedepaula@gmail.com";
//        Gson g = new Gson();
//        Map<Long, Object> criteria = new HashMap<>();
//        List<Anunciante> anuncianteList = null;
//        criteria.put(UsuarioCriteria.USUARIO_EMAIL_EQ, email);
//
//        if (!email.equals("")) {
//            AnuncianteService s = new AnuncianteService();
//            anuncianteList = s.readByCriteria(criteria);
//
//        }
//
//        if (anuncianteList != null && !anuncianteList.isEmpty()) {
//            Map<String, Object> resultado = new HashMap<>();
//            resultado.put("result", "exist");
//            result = g.toJson(resultado);
//        } else {
//            Map<String, Object> resultado = new HashMap<>();
//            resultado.put("result", "not");
//            result = g.toJson(resultado);
//        }
//        System.out.println(result);
//        String anunciante = "{ nome:\"json\",apelido:\"json\",email:\"json@gi\",senha:\"jso1n\",telefone:\"9865856\"}";
//        try{            
////            Type type = new TypeToken<Anunciante>(){                
////            }.getType();
////            Gson g = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
//            Gson g = new Gson();
//            
//            Anunciante anuncianteNew = g.fromJson(anunciante, Anunciante.class);            
//            Map<String, Object> fields = new HashMap<>();
//            if(anuncianteNew != null){
//                AnuncianteService s = new AnuncianteService();
//                anuncianteNew.setPerfil(2L);
//                s.create(anuncianteNew);
//                
//            }
//        }catch(Exception e){
//            
//        }
//        Comunicacao com = new Comunicacao();
//        ItemService s = new ItemService();
//        Item item = s.readById(7L);
//        com.setItem(item);
//        
//        Mensagem msg = new Mensagem();
//        msg.setTexto("OLA, testando!!!!");
//        
//        AnuncianteService as = new AnuncianteService();
//        Anunciante anun = as.readById(1L);
//        msg.setUsuario(anun);
//        
//        com.getMensagemList().add(msg);
//        
//        msg = new Mensagem();
//        msg.setTexto("aosdjahbdajsnk");
//        msg.setUsuario(anun);
//        
//        com.getMensagemList().add(msg);
//        
//        msg = new Mensagem();
//        msg.setTexto("outro usuario");
//        anun = new Anunciante();
//        anun = as.readById(14L);
//        msg.setUsuario(anun);
//        
//        com.getMensagemList().add(msg);
//        
//        ComunicacaoService cs = new ComunicacaoService();
//        cs.create(com);
//        Oferta oferta = new Oferta();
//        ItemService s = new ItemService();
//        Item item = s.readById(1L);
////        oferta.setItem(item);
//        
//        OfertaItem oItem = new OfertaItem();
////        oItem.setItemDescrito("Troco por esses itens aí!!!");
////        item = s.readById(3L);
////        oItem.getItemList().add(item);
////        item = s.readById(4L);
////        oItem.getItemList().add(item);
////        
////        oferta.setOfertaItem(oItem);
////        
//        OfertaService os = new OfertaService();
//        List<Oferta> ofertaList = os.readByCriteria(null);
        try {
            ItemService s = new ItemService();
            List<Item> itensLista = new ArrayList<>();
            Item item = new Item();
            item = s.readById(1L);
            itensLista.add(item);
            item = s.readById(2L);
            itensLista.add(item);

            Gson gson = new Gson();
            String itens = gson.toJson(itensLista);

//            Type type = new TypeToken<List<Item>>() {
//            }.getType();
            TypeToken<List<Item>> token = new TypeToken<List<Item>>() {
            };
            List<Item> ofertaItens = gson.fromJson(itens, token.getType());

            Oferta oferta = new Oferta();
            item = s.readById(3L);
            oferta.setItem(item);
            OfertaItem ofertaItem = new OfertaItem();
            ofertaItem.setItemList(ofertaItens);
            oferta.setOfertaItem(ofertaItem);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
