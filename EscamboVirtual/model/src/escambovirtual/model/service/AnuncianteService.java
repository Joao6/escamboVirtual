package escambovirtual.model.service;

import escambovirtual.model.base.service.BaseAnuncianteService;
import escambovirtual.model.entity.Anunciante;
import java.sql.Connection;
import java.util.List;
import java.util.Map;
import escambovirtual.model.ConnectionManager;
import escambovirtual.model.criteria.UsuarioCriteria;
import escambovirtual.model.dao.UsuarioDAO;
import java.util.HashMap;

/**
 *
 * @author Joao
 */
public class AnuncianteService implements BaseAnuncianteService {

    @Override
    public void create(Anunciante entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            UsuarioDAO dao = new UsuarioDAO();
            dao.create(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public Anunciante readById(Long id) throws Exception {
        Anunciante anunciante = null;

        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            UsuarioDAO dao = new UsuarioDAO();
            anunciante = (Anunciante) dao.readById(conn, id);
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }

        return anunciante;
    }

    @Override
    public List<Anunciante> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {

        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Anunciante> anuncianteList = null;
        
        try {
            UsuarioDAO dao = new UsuarioDAO(); 
            if (criteria == null) {
                criteria = new HashMap<>();
            }
            criteria.remove(UsuarioCriteria.ADMINISTRADOR);
            criteria.put(UsuarioCriteria.ANUNCIANTE, Boolean.TRUE);
            anuncianteList = (List)dao.readByCriteria(conn,criteria, null, null);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }

        return anuncianteList;
    }

    @Override
    public void update(Anunciante entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try{
            UsuarioDAO dao = new UsuarioDAO();
            dao.update(conn, entity);
            conn.commit();
            conn.close();
        }catch(Exception e){
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public void delete(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try{
            UsuarioDAO dao = new UsuarioDAO();
            dao.delete(conn, id);
            conn.commit();
            conn.close();
        }catch(Exception e){
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public Map<String, String> validate(Map<String, Object> fields) throws Exception {
        Map<String, String> errors = new HashMap<>();
        
        String email = (String) fields.get("email");
        if(email == null || email.trim().isEmpty()){
            errors.put("email", "Este Campo é obrigatório!");
        }else{
            Map<Long, Object> criteria = new HashMap<>();
            criteria.put(UsuarioCriteria.USUARIO_EMAIL_EQ, email);            
            List<Anunciante> anuncianteList = readByCriteria(criteria, null, null);
            if(!anuncianteList.isEmpty()){
                errors.put("email", "Este email já está cadastrado no sistema!");
            }
        }        
        return errors;
    }

    @Override
    public Long countByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
