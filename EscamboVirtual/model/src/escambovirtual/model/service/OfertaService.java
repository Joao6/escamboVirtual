package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BaseOfertaService;
import escambovirtual.model.dao.OfertaDAO;
import escambovirtual.model.entity.Oferta;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class OfertaService implements BaseOfertaService {

    @Override
    public void create(Oferta entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            OfertaDAO dao = new OfertaDAO();
            dao.create(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public Oferta readById(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Oferta oferta = null;
        try {
            OfertaDAO dao = new OfertaDAO();
            oferta = dao.readById(conn, id);
            conn.close();
        } catch (Exception e) {
            conn.close();
        }
        return oferta;
    }

    @Override
    public List<Oferta> readByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Oferta> ofertaList = null;
        try {
            OfertaDAO dao = new OfertaDAO();
            ofertaList = dao.readByCriteria(conn, criteria);
            conn.close();
        } catch (Exception e) {
            conn.close();
        }
        return ofertaList;
    }

    @Override
    public void update(Oferta entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Map<String, String> validate(Map<String, Object> fields) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
