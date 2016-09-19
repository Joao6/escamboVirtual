package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BaseCidadeService;
import escambovirtual.model.dao.CidadeDAO;
import escambovirtual.model.entity.Cidade;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class CidadeService implements BaseCidadeService{

    @Override
    public void create(Cidade entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cidade readById(Long id) throws Exception {
        Cidade cidade = null;

        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            CidadeDAO dao = new CidadeDAO();
            cidade = dao.readById(conn, id);
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return cidade;
    }

    @Override
    public List<Cidade> readByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Cidade> cidadeList = null;
        try {
            CidadeDAO dao = new CidadeDAO();
            cidadeList = dao.readByCriteria(conn, criteria);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return cidadeList;
    }

    @Override
    public void update(Cidade entity) throws Exception {
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
