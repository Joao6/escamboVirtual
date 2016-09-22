package escambovirtual.model.dao;

import escambovirtual.model.base.BaseDAO;
import escambovirtual.model.criteria.LocalizacaoCriteria;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Cidade;
import escambovirtual.model.entity.Estado;
import escambovirtual.model.entity.Localizacao;
import escambovirtual.model.entity.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joao
 */
public class LocalizacaoDAO implements BaseDAO<Localizacao> {

    @Override
    public void create(Connection conn, Localizacao entity) throws Exception {
        String sql = "INSERT INTO localizacao(nome, estado_fk, cidade_fk, bairro, rua, numero, usuario_fk) VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING id;";

        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());
        if (entity.getEstado() != null) {
            ps.setLong(++i, entity.getEstado().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        if (entity.getCidade() != null) {
            ps.setLong(++i, entity.getCidade().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        ps.setString(++i, entity.getBairro());
        ps.setString(++i, entity.getRua());
        ps.setString(++i, entity.getNumero());

        ps.setLong(++i, entity.getUsuario().getId());

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            entity.setId(rs.getLong("id"));
        }

        rs.close();
        ps.close();
    }

    @Override
    public Localizacao readById(Connection conn, Long id) throws Exception {
        String sql = "select localizacao.*, estado.nome estado_nome, estado.uf estado_uf, cidade.nome cidade_nome, usuario.id usuario_id, usuario.nome usuario_nome, usuario.apelido usuario_apelido, usuario.email usuario_email, usuario.perfil usuario_perfil from localizacao join usuario on localizacao.usuario_fk=usuario.id left join anunciante on anunciante.usuario_fk=usuario.id left join administrador on administrador.usuario_fk=usuario.id left join estado on localizacao.estado_fk=estado.id left join cidade on localizacao.cidade_fk=cidade.id WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        Localizacao localizacao = null;

        if (rs.next()) {
            localizacao = new Localizacao();
            localizacao.setId(rs.getLong("id"));
            localizacao.setBairro(rs.getString("bairro"));
            localizacao.setNome(rs.getString("nome"));
            localizacao.setNumero(rs.getString("numero"));
            localizacao.setRua(rs.getString("rua"));

            if (rs.getLong("cidade_fk") > 0) {
                Cidade cidade = new Cidade();
                cidade.setId(rs.getLong("cidade_fk"));
                cidade.setNome(rs.getString("cidade_nome"));
                Estado estado = new Estado();
                estado.setId(rs.getLong("estado_fk"));
                estado.setNome(rs.getString("estado_nome"));
                estado.setUf(rs.getString("estado_uf"));
                cidade.setEstado(estado);
                localizacao.setCidade(cidade);
                localizacao.setEstado(estado);
            }
            Usuario usuario = null;
            if (rs.getInt("usuario_perfil") == 1) {
                usuario = new Administrador();
            } else {
                usuario = new Anunciante();
            }
            usuario.setNome(rs.getString("usuario_nome"));
            usuario.setEmail(rs.getString("usuario_email"));
            usuario.setApelido(rs.getString("usuario_apelido"));
            usuario.setPerfil(rs.getLong("usuario_perfil"));

            localizacao.setUsuario(usuario);
        }
        rs.close();
        ps.close();

        return localizacao;
    }

    @Override
    public List<Localizacao> readByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        String sql = "select localizacao.*, estado.nome estado_nome, estado.uf estado_uf, cidade.nome cidade_nome, usuario.id usuario_id, usuario.nome usuario_nome, usuario.apelido usuario_apelido, usuario.email usuario_email, usuario.perfil usuario_perfil from localizacao join usuario on localizacao.usuario_fk=usuario.id left join anunciante on anunciante.usuario_fk=usuario.id left join administrador on administrador.usuario_fk=usuario.id left join estado on localizacao.estado_fk=estado.id left join cidade on localizacao.cidade_fk=cidade.id WHERE 1=1 ";

        //Critérios de busca caso existam.
        sql += applyCriteria(conn, criteria);

        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<Localizacao> localizaoList = new ArrayList<>();
        while (rs.next()) {
            Localizacao localizacao = new Localizacao();
            localizacao.setId(rs.getLong("id"));
            localizacao.setBairro(rs.getString("bairro"));
            localizacao.setNome(rs.getString("nome"));
            localizacao.setNumero(rs.getString("numero"));
            localizacao.setRua(rs.getString("rua"));

            if (rs.getLong("cidade_fk") > 0) {
                Cidade cidade = new Cidade();
                cidade.setId(rs.getLong("cidade_fk"));
                cidade.setNome(rs.getString("cidade_nome"));
                Estado estado = new Estado();
                estado.setId(rs.getLong("estado_fk"));
                estado.setNome(rs.getString("estado_nome"));
                estado.setUf(rs.getString("estado_uf"));
                cidade.setEstado(estado);
                localizacao.setCidade(cidade);
                localizacao.setEstado(estado);
            }

            Usuario usuario = null;
            if (rs.getInt("usuario_perfil") == 1) {
                usuario = new Administrador();
            } else {
                usuario = new Anunciante();
            }
            usuario.setNome(rs.getString("usuario_nome"));
            usuario.setEmail(rs.getString("usuario_email"));
            usuario.setApelido(rs.getString("usuario_apelido"));
            usuario.setPerfil(rs.getLong("usuario_perfil"));

            localizacao.setUsuario(usuario);
            localizaoList.add(localizacao);
        }
        rs.close();
        ps.close();

        return localizaoList;
    }

    @Override
    public void update(Connection conn, Localizacao entity) throws Exception {
        String sql = "UPDATE localizacao SET nome=?, estado_fk=?, cidade_fk=?, bairro=?, rua=?, numero=?, usuario_fk=? WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);

        int i = 0;
        ps.setString(++i, entity.getNome());
        if (entity.getEstado() != null) {
            ps.setLong(++i, entity.getEstado().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        if (entity.getCidade() != null) {
            ps.setLong(++i, entity.getCidade().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        ps.setString(++i, entity.getBairro());
        ps.setString(++i, entity.getRua());
        ps.setString(++i, entity.getNumero());

        ps.setLong(++i, entity.getUsuario().getId());
        
        ps.setLong(++i, entity.getId());

        ps.execute();
        ps.close();
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String sql = "DELETE FROM localizacao WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public String applyCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "";
        Long usuarioID = (Long) criteria.get(LocalizacaoCriteria.USUARIO_EQ);
        if (usuarioID > 0) {
            sql += " AND localizacao.usuario_fk="+usuarioID;
        }
        return sql;
    }

    @Override
    public Long countByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
