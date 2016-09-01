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
    public List<Anunciante> readByCriteria(Map<Long, Object> criteria) throws Exception {

        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Anunciante> anuncianteList = null;
        
        try {
            UsuarioDAO dao = new UsuarioDAO(); 
            if (criteria == null) {
                criteria = new HashMap<>();
            }
            criteria.remove(UsuarioCriteria.ADMINISTRADOR);
            criteria.put(UsuarioCriteria.ANUNCIANTE, Boolean.TRUE);
            anuncianteList = (List)dao.readByCriteria(conn,criteria);
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

}
