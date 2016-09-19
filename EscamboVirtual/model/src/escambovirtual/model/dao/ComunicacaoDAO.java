package escambovirtual.model.dao;

import escambovirtual.model.base.BaseDAO;
import escambovirtual.model.entity.Comunicacao;
import escambovirtual.model.entity.Mensagem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class ComunicacaoDAO implements BaseDAO<Comunicacao> {

    @Override
    public void create(Connection conn, Comunicacao entity) throws Exception {
        String sql = "INSERT INTO comunicacao(item_fk, usuario_fk) VALUES (?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setLong(++i, entity.getItem().getId());        
        ps.setLong(++i, entity.getItem().getAnunciante().getId());
        ps.close();

        updateMensagemList(conn, entity);
    }

    public void updateMensagemList(Connection conn, Comunicacao entity) throws SQLException {
        String sql = "DELETE FROM mensagem WHERE comunicacao_fk=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, entity.getId());
        ps.execute();
        ps.close();

        for (Mensagem aux : entity.getMensagemList()) {
            sql = "INSERT INTO mensagem(texto, data_hora, comunicacao_fk, usuario_fk) VALUES (?, ?, ?, ?) RETURNING id";
            ps = conn.prepareStatement(sql);
            int i = 0;
            ps.setString(++i, aux.getTexto());
            //setando a data da mensagem
            java.sql.Date data2 = new java.sql.Date(new java.util.Date().getTime());
            ps.setDate(++i, data2);
            ps.setLong(++i, entity.getId());
            ps.setLong(++i, aux.getUsuario().getId());
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                aux.setId(rs.getLong("id"));
            }
            rs.close();
            ps.close();
//            entity.getMensagemList().add(aux);
        }
    }

    @Override
    public Comunicacao readById(Connection conn, Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Comunicacao> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Connection conn, Comunicacao entity) throws Exception {
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
