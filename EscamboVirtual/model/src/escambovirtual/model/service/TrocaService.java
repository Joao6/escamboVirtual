package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BaseTrocaService;
import escambovirtual.model.dao.OfertaDAO;
import escambovirtual.model.dao.TrocaDAO;
import escambovirtual.model.entity.Oferta;
import escambovirtual.model.entity.Troca;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class TrocaService implements BaseTrocaService{

    @Override
    public void create(Troca entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            TrocaDAO dao = new TrocaDAO();
            dao.create(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public Troca readById(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Troca troca = null;
        try {
            TrocaDAO dao = new TrocaDAO();
            troca = dao.readById(conn, id);
            conn.close();
        } catch (Exception e) {
            conn.close();
        }
        return troca;
    }

    @Override
    public List<Troca> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Troca> trocaList = null;
        try {
            TrocaDAO dao = new TrocaDAO();
            trocaList = dao.readByCriteria(conn, criteria, null, null);
            conn.close();
        } catch (Exception e) {
            conn.close();
        }
        return trocaList;
    }

    @Override
    public void update(Troca entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Long countByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Map<String, String> validate(Map<String, Object> fields) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
