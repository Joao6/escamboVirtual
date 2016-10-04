package escambovirtual.model.service;

import escambovirtual.model.ConnectionManager;
import escambovirtual.model.base.service.BaseItemService;
import escambovirtual.model.dao.ItemDAO;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.ItemImagem;
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
            List<ItemImagem> itemImagemList = entity.getItemImagemList();
            if (itemImagemList != null) {
                for (ItemImagem itemImagem : itemImagemList) {
                    itemImagem.setItem(entity);
                    dao.createImage(conn, itemImagem);
                }
            }
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
            item.setItemImagemList(dao.readImagesHashByItemId(conn, item.getId()));
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return item;
    }

    @Override
    public List<Item> readByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Item> itemList = null;
        try {
            ItemDAO dao = new ItemDAO();
            itemList = dao.readByCriteria(conn, criteria, limit, offset);
            if (itemList != null) {
                for (Item item : itemList) {
                    item.setItemImagemList(dao.readImagesHashByItemId(conn, item.getId()));
                }
            }
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

    @Override
    public Map<String, String> validate(Map<String, Object> fields) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Long countByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Long count = null;
        try {
            ItemDAO dao = new ItemDAO();
            count = dao.countByCriteria(conn, criteria, limit, offset);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
        }
        return count;
    }

    public ItemImagem readImageByHash(String hash) throws Exception {

        ItemImagem itemImagem = null;

        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            ItemDAO dao = new ItemDAO();
            itemImagem = dao.readImageByHash(conn, hash);
            conn.close();
        } catch (Exception e) {
            conn.close();
        }

        return itemImagem;
    }

}
