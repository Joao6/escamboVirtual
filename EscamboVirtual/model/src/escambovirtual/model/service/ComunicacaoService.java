package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BaseComunicacaoService;
import escambovirtual.model.dao.ComunicacaoDAO;
import escambovirtual.model.entity.Comunicacao;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class ComunicacaoService implements BaseComunicacaoService {

    @Override
    public void create(Comunicacao entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            ComunicacaoDAO dao = new ComunicacaoDAO();
            dao.create(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public Comunicacao readById(Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Comunicacao> readByCriteria(Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Comunicacao entity) throws Exception {
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
