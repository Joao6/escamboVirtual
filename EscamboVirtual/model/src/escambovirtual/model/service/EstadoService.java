package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BaseEstadoService;
import escambovirtual.model.dao.EstadoDAO;
import escambovirtual.model.entity.Estado;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class EstadoService implements BaseEstadoService{

    @Override
    public void create(Estado entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Estado readById(Long id) throws Exception {
        Estado estado = null;

        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            EstadoDAO dao = new EstadoDAO();
            estado = dao.readById(conn, id);
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return estado;
    }

    @Override
    public List<Estado> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Estado> estadoList = null;
        try {
            EstadoDAO dao = new EstadoDAO();
            estadoList = dao.readByCriteria(conn, criteria, null, null);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return estadoList;
    }

    @Override
    public void update(Estado entity) throws Exception {
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

    @Override
    public Long countByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
