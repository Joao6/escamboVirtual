package escambovirtual.model.base;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public interface BaseCRUDService<E extends BaseEntity> {
    //fica aqui os serviços do CRUD
    
    public void create(E entity) throws Exception;
    
    public E readById(Long id) throws Exception;
    
    public List<E> readByCriteria(Map<Long,Object> criteria, Long limit, Long offset) throws Exception;
    
    public void update(E entity) throws Exception;
    
    public void delete(Long id) throws Exception;
    
    public Long countByCriteria(Map<Long, Object> criteria, Long limit, Long offset) throws Exception;
    
    public Map<String, String> validate(Map<String, Object> fields) throws Exception;
}
