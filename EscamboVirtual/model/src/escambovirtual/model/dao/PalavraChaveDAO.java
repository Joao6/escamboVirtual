package escambovirtual.model.dao;

import escambovirtual.model.base.BaseDAO;
import escambovirtual.model.entity.PalavraChave;
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
public class PalavraChaveDAO implements BaseDAO<PalavraChave> {

    @Override
    public void create(Connection conn, PalavraChave entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PalavraChave readById(Connection conn, Long id) throws Exception {
        String sql = "SELECT id, nome, descricao FROM palavra_chave WHERE id=?";
        PalavraChave palavraChave = null;
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            palavraChave = new PalavraChave();
            palavraChave.setId(id);
            palavraChave.setNome(rs.getString("nome"));
            palavraChave.setDescricao(rs.getString("descricao"));
        }
        rs.close();
        ps.close();
        return palavraChave;
    }

    @Override
    public List<PalavraChave> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "SELECT id, nome, descricao FROM palavra_chave";
        List<PalavraChave> palavraChaveList = new ArrayList<>();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            PalavraChave palavraChave = new PalavraChave();
            palavraChave.setId(rs.getLong("id"));
            palavraChave.setNome(rs.getString("nome"));
            palavraChave.setDescricao(rs.getString("descricao"));
            
            palavraChaveList.add(palavraChave);
        }
        rs.close();
        ps.close();
        return palavraChaveList;
    }

    @Override
    public void update(Connection conn, PalavraChave entity) throws Exception {
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
    
}
