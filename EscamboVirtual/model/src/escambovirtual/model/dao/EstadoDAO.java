package escambovirtual.model.dao;

import escambovirtual.model.base.BaseDAO;
import escambovirtual.model.entity.Estado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class EstadoDAO implements BaseDAO<Estado> {

    @Override
    public void create(Connection conn, Estado entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Estado readById(Connection conn, Long id) throws Exception {
        Estado estado = null;
        String sql = "SELECT id, nome, uf FROM estado WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            estado = new Estado();
            estado.setId(rs.getLong("id"));
            estado.setNome(rs.getString("nome"));
            estado.setUf(rs.getString("uf"));
        }
        rs.close();
        ps.close();
        return estado;
    }

    @Override
    public List<Estado> readByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {        
        String sql = "SELECT id, nome, uf FROM estado WHERE 1=1 ";   
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
                
        List<Estado> estadoList = new ArrayList<>();
        
        while(rs.next()){
            Estado estado = new Estado();
            estado.setId(rs.getLong("id"));
            estado.setNome(rs.getString("nome"));
            estado.setUf(rs.getString("uf"));
            
            estadoList.add(estado);
        }
        rs.close();
        ps.close();
        return estadoList;
    }

    @Override
    public void update(Connection conn, Estado entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String applyCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Long countByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
