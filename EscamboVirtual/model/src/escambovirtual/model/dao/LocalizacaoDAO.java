package escambovirtual.model.dao;

import escambovirtual.model.base.BaseDAO;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Cidade;
import escambovirtual.model.entity.Estado;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.Localizacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;
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
        String sql = "INSERT INTO localizacao(nome, estado_fk, cidade_fk, bairro, rua, numero, usuario_fk, item_fk) VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING id;";

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
        ps.setString(++i, entity.getNumero());

        if (entity.getAnunciante() != null) {
            ps.setLong(++i, entity.getAnunciante().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        if (entity.getAdm() != null) {
            ps.setLong(++i, entity.getAdm().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        if (entity.getItem() != null) {
            ps.setLong(++i, entity.getItem().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            entity.setId(rs.getLong("id"));
        }

        rs.close();
        ps.close();
    }

    @Override
    public Localizacao readById(Connection conn, Long id) throws Exception {
        String sql = "";
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

            if (rs.getLong("cidade_id") > 0) {
                Cidade cidade = new Cidade();
                cidade.setId(rs.getLong("cidade_id"));
                cidade.setNome(rs.getString("cidade_nome"));
                Estado estado = new Estado();
                estado.setId(rs.getLong("estado_id"));
                estado.setNome(rs.getString("estado_nome"));
                estado.setUf(rs.getString("estado_uf"));
                cidade.setEstado(estado);
                localizacao.setCidade(cidade);
                localizacao.setEstado(estado);
            }

            if (rs.getLong("anunciante_id") > 0) {
                Anunciante anunciante = new Anunciante();
                anunciante.setId(rs.getLong("anunciante_id"));
                anunciante.setApelido(rs.getString("anunciante_apelido"));
                anunciante.setData_cadastro(rs.getDate("anunciante_cadastro"));
                anunciante.setEmail(rs.getString("anunciante_email"));
                //anunciante.setNascimento(rs.getString("anunciante_nascimento"));
                anunciante.setPerfil(rs.getInt("anunciante_perfil"));
                anunciante.setReputacao(rs.getInt("anunciante_reputacao"));
                anunciante.setSenha(rs.getString("anunciante_senha"));
                anunciante.setSexo(rs.getString("anunciante_sexo"));
                anunciante.setSobrenome(rs.getString("anunciante_sobrenome"));
                anunciante.setTelefone(rs.getString("anunciante_telefone"));

                localizacao.setAnunciante(anunciante);
            }

            if (rs.getLong("adm_id") > 0) {
                Administrador adm = new Administrador();
                adm.setId(rs.getLong("adm_id"));
                adm.setApelido(rs.getString("adm_apelido"));
                adm.setData_cadastro(rs.getDate("adm_cadastro"));
                adm.setEmail(rs.getString("adm_email"));
                //adm.setNascimento(rs.getString("adm_nascimento"));
                adm.setPerfil(rs.getInt("adm_perfil"));
                adm.setCpf(rs.getString("adm_cpf"));
                adm.setSenha(rs.getString("adm_senha"));
                adm.setSexo(rs.getString("adm_sexo"));
                adm.setSobrenome(rs.getString("adm_sobrenome"));
                adm.setTelefone(rs.getString("adm_telefone"));

                localizacao.setAdm(adm);
            }

            if (rs.getLong("item_id") > 0) {
                Item item = new Item();
                item.setId(rs.getLong("item_id"));
//                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//                java.sql.Date data = new java.sql.Date(format.parse(rs.getDate("item_data_compra").getTime()));
//                java.sql.Date data1 = (rs.getDate("item_data_compra"));
//                item.setDataAquisicao(data1);
                item.setDescricao(rs.getString("item_descricao"));
                item.setNome(rs.getString("item_nome"));
                item.setStatus(rs.getString("item_status"));
                //item.setDataCadastro(rs.getDate("item_data_cadastro"));

                Anunciante anunciante = new Anunciante();
                anunciante.setId(rs.getLong("anunciante_id"));
                anunciante.setApelido(rs.getString("anunciante_apelido"));
                anunciante.setData_cadastro(rs.getDate("anunciante_cadastro"));
                anunciante.setEmail(rs.getString("anunciante_email"));
                //anunciante.setNascimento(rs.getString("anunciante_nascimento"));
                anunciante.setPerfil(rs.getInt("anunciante_perfil"));
                anunciante.setReputacao(rs.getInt("anunciante_reputacao"));
                anunciante.setSenha(rs.getString("anunciante_senha"));
                anunciante.setSexo(rs.getString("anunciante_sexo"));
                anunciante.setSobrenome(rs.getString("anunciante_sobrenome"));
                anunciante.setTelefone(rs.getString("anunciante_telefone"));

                item.setAnunciante(anunciante);
                localizacao.setItem(item);
            }
        }
        rs.close();
        ps.close();

        return localizacao;
    }

    @Override
    public List<Localizacao> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "WHERE 1=1 ";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        //Critérios de busca caso existam.

        List<Localizacao> localizaoList = new ArrayList<>();
        while (rs.next()) {
            Localizacao localizacao = new Localizacao();
            localizacao.setId(rs.getLong("id"));
            localizacao.setBairro(rs.getString("bairro"));
            localizacao.setNome(rs.getString("nome"));
            localizacao.setNumero(rs.getString("numero"));
            localizacao.setRua(rs.getString("rua"));

            if (rs.getLong("cidade_id") > 0) {
                Cidade cidade = new Cidade();
                cidade.setId(rs.getLong("cidade_id"));
                cidade.setNome(rs.getString("cidade_nome"));
                Estado estado = new Estado();
                estado.setId(rs.getLong("estado_id"));
                estado.setNome(rs.getString("estado_nome"));
                estado.setUf(rs.getString("estado_uf"));
                cidade.setEstado(estado);
                localizacao.setCidade(cidade);
                localizacao.setEstado(estado);
            }

            if (rs.getLong("anunciante_id") > 0) {
                Anunciante anunciante = new Anunciante();
                anunciante.setId(rs.getLong("anunciante_id"));
                anunciante.setApelido(rs.getString("anunciante_apelido"));
                anunciante.setData_cadastro(rs.getDate("anunciante_cadastro"));
                anunciante.setEmail(rs.getString("anunciante_email"));
                //anunciante.setNascimento(rs.getString("anunciante_nascimento"));
                anunciante.setPerfil(rs.getInt("anunciante_perfil"));
                anunciante.setReputacao(rs.getInt("anunciante_reputacao"));
                anunciante.setSenha(rs.getString("anunciante_senha"));
                anunciante.setSexo(rs.getString("anunciante_sexo"));
                anunciante.setSobrenome(rs.getString("anunciante_sobrenome"));
                anunciante.setTelefone(rs.getString("anunciante_telefone"));

                localizacao.setAnunciante(anunciante);
            }

            if (rs.getLong("adm_id") > 0) {
                Administrador adm = new Administrador();
                adm.setId(rs.getLong("adm_id"));
                adm.setApelido(rs.getString("adm_apelido"));
                adm.setData_cadastro(rs.getDate("adm_cadastro"));
                adm.setEmail(rs.getString("adm_email"));
                //adm.setNascimento(rs.getString("adm_nascimento"));
                adm.setPerfil(rs.getInt("adm_perfil"));
                adm.setCpf(rs.getString("adm_cpf"));
                adm.setSenha(rs.getString("adm_senha"));
                adm.setSexo(rs.getString("adm_sexo"));
                adm.setSobrenome(rs.getString("adm_sobrenome"));
                adm.setTelefone(rs.getString("adm_telefone"));

                localizacao.setAdm(adm);
            }

            if (rs.getLong("item_id") > 0) {
                Item item = new Item();
                item.setId(rs.getLong("item_id"));
//                item.setDataAquisicao(rs.getDate("item_data_compra"));
                item.setDescricao(rs.getString("item_descricao"));
                item.setNome(rs.getString("item_nome"));
                item.setStatus(rs.getString("item_status"));
                //item.setDataCadastro(rs.getDate("item_data_cadastro"));

                Anunciante anunciante = new Anunciante();
                anunciante.setId(rs.getLong("anunciante_id"));
                anunciante.setApelido(rs.getString("anunciante_apelido"));
                anunciante.setData_cadastro(rs.getDate("anunciante_cadastro"));
                anunciante.setEmail(rs.getString("anunciante_email"));
                //anunciante.setNascimento(rs.getString("anunciante_nascimento"));
                anunciante.setPerfil(rs.getInt("anunciante_perfil"));
                anunciante.setReputacao(rs.getInt("anunciante_reputacao"));
                anunciante.setSenha(rs.getString("anunciante_senha"));
                anunciante.setSexo(rs.getString("anunciante_sexo"));
                anunciante.setSobrenome(rs.getString("anunciante_sobrenome"));
                anunciante.setTelefone(rs.getString("anunciante_telefone"));

                item.setAnunciante(anunciante);
                localizacao.setItem(item);
            }

            localizaoList.add(localizacao);
        }
        rs.close();
        ps.close();

        return localizaoList;
    }

    @Override
    public void update(Connection conn, Localizacao entity) throws Exception {
        String sql = "";
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
        ps.setString(++i, entity.getNumero());

        if (entity.getAnunciante() != null) {
            ps.setLong(++i, entity.getAnunciante().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        if (entity.getAdm() != null) {
            ps.setLong(++i, entity.getAdm().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        if (entity.getItem() != null) {
            ps.setLong(++i, entity.getItem().getId());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            entity.setId(rs.getLong("id"));
        }
        rs.close();
        ps.close();
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String sql = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public String applyCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
