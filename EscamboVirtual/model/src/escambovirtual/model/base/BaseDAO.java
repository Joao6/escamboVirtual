package escambovirtual.model.base;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

public interface BaseDAO<E extends BaseEntity> {
    
    public void create(Connection conn, E entity) throws Exception;
    
    public E readById(Connection conn, Long id) throws Exception;
    
    public List<E> readByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception;
    
    public void update(Connection conn, E entity) throws Exception;
    
    public void delete(Connection conn, Long id) throws Exception;   
    
    public Long countByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception;
    
    public String applyCriteria (Connection conn, Map<Long, Object> criteria) throws Exception;
    
}
