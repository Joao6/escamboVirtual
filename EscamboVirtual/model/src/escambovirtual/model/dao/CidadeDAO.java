package escambovirtual.model.dao;

import escambovirtual.model.base.BaseDAO;
import escambovirtual.model.entity.Cidade;
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
public class CidadeDAO implements BaseDAO<Cidade> {

    @Override
    public void create(Connection conn, Cidade entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cidade readById(Connection conn, Long id) throws Exception {
        String sql = "SELECT cidade.*, estado.id estado_id, estado.nome estado_nome, estado.uf estado_uf FROM cidade JOIN estado ON cidade.estado_fk=estado.id WHERE cidade.id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        Cidade cidade = null;
        
        if(rs.next()){
            cidade = new Cidade();
            cidade.setId(rs.getLong("id"));
            cidade.setNome(rs.getString("nome"));
            Estado estado = new Estado();
            estado.setId(rs.getLong("estado_id"));
            estado.setNome(rs.getString("estado_nome"));
            estado.setUf(rs.getString("estado_uf"));
            cidade.setEstado(estado);
        }
        rs.close();
        ps.close();

        return cidade;
    }

    @Override
    public List<Cidade> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "SELECT cidade.*, estado.id estado_id, estado.nome estado_nome, estado.uf estado_uf FROM cidade JOIN estado ON cidade.estado_fk=estado.id WHERE 1=1;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<Cidade> cidadeList = new ArrayList<>();
        
        while(rs.next()){
            Cidade cidade = new Cidade();
            cidade.setId(rs.getLong("id"));
            cidade.setNome(rs.getString("nome"));
            Estado estado = new Estado();
            estado.setId(rs.getLong("estado_id"));
            estado.setNome(rs.getString("estado_nome"));
            estado.setUf(rs.getString("estado_uf"));
            cidade.setEstado(estado);
            
            cidadeList.add(cidade);
        }
        rs.close();
        ps.close();
        return cidadeList;
    }

    @Override
    public void update(Connection conn, Cidade entity) throws Exception {
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
