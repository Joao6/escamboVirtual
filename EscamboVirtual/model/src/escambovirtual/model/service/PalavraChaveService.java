package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BasePalavraChaveService;
import escambovirtual.model.dao.PalavraChaveDAO;
import escambovirtual.model.entity.PalavraChave;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class PalavraChaveService implements BasePalavraChaveService {

    @Override
    public void create(PalavraChave entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PalavraChave readById(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        PalavraChave palavraChave = null;
        try{
            PalavraChaveDAO dao = new PalavraChaveDAO();
            palavraChave = dao.readById(conn, id);
            conn.close();
        }catch(Exception e){
            conn.close();
        }
        return palavraChave;
    }

    @Override
    public List<PalavraChave> readByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<PalavraChave> palavraChaveList = new ArrayList<>();
        try{
            PalavraChaveDAO dao = new PalavraChaveDAO();
            palavraChaveList = dao.readByCriteria(conn, criteria);
            conn.close();
        }catch(Exception e){
            conn.close();
        }
        return palavraChaveList;
    }

    @Override
    public void update(PalavraChave entity) throws Exception {
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
