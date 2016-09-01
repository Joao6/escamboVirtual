package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BaseItemService;
import escambovirtual.model.dao.ItemDAO;
import escambovirtual.model.entity.Item;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class ItemService implements BaseItemService {

    @Override
    public void create(Item entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            ItemDAO dao = new ItemDAO();
            dao.create(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public Item readById(Long id) throws Exception {
        Item item = null;

        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            ItemDAO dao = new ItemDAO();
            item = dao.readById(conn, id);
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return item;
    }

    @Override
    public List<Item> readByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Item> itemList = null;
        try {
            ItemDAO dao = new ItemDAO();
            itemList = dao.readByCriteria(conn, criteria);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return itemList;
    }

    @Override
    public void update(Item entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            ItemDAO dao = new ItemDAO();
            dao.update(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

    @Override
    public void delete(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            ItemDAO dao = new ItemDAO();
            dao.delete(conn, id);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
    }

}
