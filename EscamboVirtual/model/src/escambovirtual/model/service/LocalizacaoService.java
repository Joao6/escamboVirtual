package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BaseLocalizacaoService;
import escambovirtual.model.dao.LocalizacaoDAO;
import escambovirtual.model.entity.Localizacao;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class LocalizacaoService implements BaseLocalizacaoService {

    @Override
    public void create(Localizacao entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            LocalizacaoDAO dao = new LocalizacaoDAO();
            dao.create(conn, entity);
            conn.commit();
        } catch (Exception e) {
            conn.rollback();
        } finally {
            conn.close();
        }
    }

    @Override
    public Localizacao readById(Long id) throws Exception {
        Localizacao localizacao = null;
        Connection conn = ConnectionManager.getInstance().getConnection();

        try {
            LocalizacaoDAO dao = new LocalizacaoDAO();
            localizacao = dao.readById(conn, id);

        } catch (Exception e) {
            conn.rollback();
        } finally {
            conn.close();
        }
        return localizacao;
    }

    @Override
    public List<Localizacao> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        List<Localizacao> localizacaoList = null;
        Connection conn = ConnectionManager.getInstance().getConnection();

        try {
            LocalizacaoDAO dao = new LocalizacaoDAO();
            localizacaoList = dao.readByCriteria(conn, criteria, null, null);
        } catch (Exception e) {
            conn.rollback();
        } finally {
            conn.close();
        }
        return localizacaoList;
    }

    @Override
    public void update(Localizacao entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();

        try {
            LocalizacaoDAO dao = new LocalizacaoDAO();
            dao.update(conn, entity);
            conn.commit();
        } catch (Exception e) {
            conn.rollback();
        } finally {
            conn.close();
        }
    }

    @Override
    public void delete(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();

        try {
            LocalizacaoDAO dao = new LocalizacaoDAO();
            dao.delete(conn, id);
            conn.commit();
        } catch (Exception e) {
            conn.rollback();
        } finally {
            conn.close();
        }
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
