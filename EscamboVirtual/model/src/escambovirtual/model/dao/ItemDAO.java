package escambovirtual.model.dao;

import escambovirtual.model.base.BaseDAO;
import escambovirtual.model.criteria.ItemCriteria;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Item;
import escambovirtual.model.entity.PalavraChave;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ItemDAO implements BaseDAO<Item> {

    @Override
    public void create(Connection conn, Item entity) throws Exception {
        String sql = "INSERT INTO item(nome, data_compra, data_hora_cadastro, status, descricao, usuario_fk, interesse1, interesse2, interesse3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING id";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());

        //convertendo a string do formulario para o tipo date para salvar no banco
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        java.sql.Date data = new java.sql.Date(format.parse(entity.getDataAquisicao()).getTime());
        ps.setDate(++i, data);
        //ps.setDate(++i, entity.getDataAquisicao());
        java.sql.Date data2 = new java.sql.Date(new java.util.Date().getTime());
        ps.setDate(++i, data2);
        if (entity.getStatus() != null) {
            ps.setString(++i, entity.getStatus());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        if (entity.getDescricao() != null) {
            ps.setString(++i, entity.getDescricao());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        ps.setLong(++i, entity.getAnunciante().getId());

        ps.setString(++i, entity.getInteresse1());
        ps.setString(++i, entity.getInteresse2());
        ps.setString(++i, entity.getInteresse3());

        ResultSet rs = ps.executeQuery();

        Long idItem = 0L;
        if (rs.next()) {
            entity.setId(rs.getLong("id"));
            idItem = rs.getLong("id");
        }
        rs.close();
        ps.close();

        //updatePalavraChaveList(conn, entity);

        /*
         String sql2 = "INSERT INTO item_imagem(item_fk, imagem1, imagem2, imagem3, imagem4, imagem5)VALUES (?, ?, ?, ?, ?, ?);";
         PreparedStatement ps2 = conn.prepareStatement(sql2);
         int i2 = 0;
         ps2.setLong(++i2,idItem);
         ps2.execute();
         ps2.close();
         System.out.println(sql2);
         */
    }

    private void updatePalavraChaveList(Connection conn, Item entity) throws SQLException {
        String sql = "DELETE FROM item_palavra_chave WHERE item_fk=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, entity.getId());
        ps.execute();
        ps.close();

        sql = "INSERT INTO item_palavra_chave(item_fk, palavra_chave_fk) VALUES (?, ?);";
        ps = conn.prepareStatement(sql);
        for (PalavraChave palavraChave : entity.getPalavraChave()) {
            int i = 0;
            ps.setLong(++i, entity.getId());
            ps.setLong(++i, palavraChave.getId());
            ps.execute();
        }
        ps.close();
    }

    @Override
    public Item readById(Connection conn, Long id) throws Exception {
        String query = "SELECT item.*, usuario.id usuario_id, usuario.nome usuario_nome, usuario.email usuario_email, usuario.senha usuario_senha, usuario.apelido usuario_apelido, usuario.sexo usuario_sexo, usuario.data_nascimento usuario_data_nascimento, usuario.perfil usuario_perfil, usuario.telefone usuario_telefone, usuario.data_cadastro usuario_data_cadastro, anunciante.reputacao anunciante_reputacao FROM item LEFT JOIN usuario on item.usuario_fk=usuario.id LEFT JOIN anunciante on usuario.id=anunciante.usuario_fk WHERE item.id=?;";

        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();

        Item item = null;
        if (rs.next()) {
            item = new Item();
            item.setId(rs.getLong("id"));
            item.setNome(rs.getString("nome"));
            String data[] = rs.getString("data_compra").split("-");
            String data2 = data[2] + "/" + data[1] + "/" + data[0];
            item.setDataAquisicao(data2);
            
            data = rs.getString("data_hora_cadastro").split("-");
            data2 = data[2] + "/" + data[1] + "/" + data[0];
            item.setDataCadastro(data2);
            item.setStatus(rs.getString("status"));
            item.setDescricao(rs.getString("descricao"));
            item.setInteresse1(rs.getString("interesse1"));
            item.setInteresse2(rs.getString("interesse2"));
            item.setInteresse3(rs.getString("interesse3"));

            Anunciante anunciante = new Anunciante();
            anunciante.setId(rs.getLong("usuario_id"));
            anunciante.setNome(rs.getString("usuario_nome"));
            anunciante.setApelido(rs.getString("usuario_apelido"));
            anunciante.setEmail(rs.getString("usuario_email"));
            anunciante.setSenha(rs.getString("usuario_senha"));
            anunciante.setSexo(rs.getString("usuario_sexo"));
            //anunciante.setNascimento(rs.getDate("usuario_data_nascimento"));
            anunciante.setPerfil(rs.getLong("usuario_perfil"));
            anunciante.setTelefone(rs.getString("usuario_telefone"));
            anunciante.setData_cadastro(rs.getDate("usuario_data_cadastro"));
            anunciante.setReputacao(rs.getInt("anunciante_reputacao"));

            item.setAnunciante(anunciante);

        }
        rs.close();
        ps.close();
        return item;
    }

    @Override
    public List<Item> readByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        String sql = "SELECT item.*, usuario.id usuario_id, usuario.nome usuario_nome, usuario.email usuario_email, usuario.senha usuario_senha, usuario.apelido usuario_apelido, usuario.sexo usuario_sexo, usuario.data_nascimento usuario_data_nascimento, usuario.perfil usuario_perfil, usuario.telefone usuario_telefone, usuario.data_cadastro usuario_data_cadastro, anunciante.reputacao anunciante_reputacao FROM item LEFT JOIN usuario on item.usuario_fk=usuario.id LEFT JOIN anunciante on usuario.id=anunciante.usuario_fk WHERE 1=1 ";

        //acrescentado critérios
        sql += this.applyCriteria(conn, criteria);

//        Long idUsuario = (Long) criteria.get(ItemCriteria.ID_USUARIO);
//        
//        Long status = (Long) criteria.get(AdministradorCriteria.ITEM_AVALIACAO);
//        
//        if(idUsuario != null && idUsuario > 0){
//            sql += " and usuario_fk = '" + idUsuario + "'";
//        }
//        
//        if(status != null && status >= 0){
//            if(status == 0){
//                sql += " and status = 'Em Avaliação'";
//            }
//            if(status == 1){
//                sql += " and status = 'Publicar'";        
//            }
//        }
//        
//        sql += " order by id asc";

        if(limit != null && limit > 0){
            sql += " limit " + limit;
        }
        if(offset != null && offset >= 0){
            sql += " offset " + offset;
        }

        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(sql);
        List<Item> itemList = new ArrayList<>();
        while (rs.next()) {
            Item item = new Item();
            item.setId(rs.getLong("id"));
            item.setNome(rs.getString("nome"));
            String data[] = rs.getString("data_compra").split("-");
            String data2 = data[2] + "/" + data[1] + "/" + data[0];
            item.setDataAquisicao(data2);
            
            data = rs.getString("data_hora_cadastro").split("-");
            data2 = data[2] + "/" + data[1] + "/" + data[0];
            item.setDataCadastro(data2);
            item.setStatus(rs.getString("status"));
            item.setDescricao(rs.getString("descricao"));
            item.setInteresse1(rs.getString("interesse1"));
            item.setInteresse2(rs.getString("interesse2"));
            item.setInteresse3(rs.getString("interesse3"));

            Anunciante anunciante = new Anunciante();
            anunciante.setId(rs.getLong("usuario_id"));
            anunciante.setNome(rs.getString("usuario_nome"));
            anunciante.setApelido(rs.getString("usuario_apelido"));
            anunciante.setEmail(rs.getString("usuario_email"));
            anunciante.setSenha(rs.getString("usuario_senha"));
            anunciante.setSexo(rs.getString("usuario_sexo"));
            //anunciante.setNascimento(rs.getDate("usuario_data_nascimento"));
            anunciante.setPerfil(rs.getLong("usuario_perfil"));
            anunciante.setTelefone(rs.getString("usuario_telefone"));
            anunciante.setData_cadastro(rs.getDate("usuario_data_cadastro"));
            anunciante.setReputacao(rs.getInt("anunciante_reputacao"));

            item.setAnunciante(anunciante);

            itemList.add(item);
        }
        rs.close();
        s.close();
        return itemList;
    }

    @Override
    public void update(Connection conn, Item entity) throws Exception {
        String sql = "UPDATE item SET nome=?, data_compra=?, data_hora_cadastro=?, status=?, descricao=?, usuario_fk=?, interesse1=?, interesse2=?, interesse3=? WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());

        if (entity.getDataAquisicao() != null) {
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            java.sql.Date data = new java.sql.Date(format.parse(entity.getDataAquisicao()).getTime());
            ps.setDate(++i, data);
        } else {
            ps.setNull(++i, Types.DATE);
        }

        if (entity.getDataCadastro() != null) {
            java.sql.Date data2 = new java.sql.Date(new java.util.Date().getTime());
            ps.setDate(++i, data2);
        } else {
            ps.setNull(++i, Types.DATE);
        }

        if (entity.getStatus() != null) {
            ps.setString(++i, entity.getStatus());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        if (entity.getDescricao() != null) {
            ps.setString(++i, entity.getDescricao());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        ps.setLong(++i, entity.getAnunciante().getId());

        if (entity.getInteresse1() != null) {
            ps.setString(++i, entity.getInteresse1());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        if (entity.getInteresse2() != null) {
            ps.setString(++i, entity.getInteresse2());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        if (entity.getInteresse3() != null) {
            ps.setString(++i, entity.getInteresse3());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        ps.setLong(++i, entity.getId());

        ps.execute();
        ps.close();

//        if (entity.getNome() != null && !entity.getNome().isEmpty()) {
//            sql += " nome = '" + entity.getNome() + "',";
//        }
////        if(entity.getDataAquisicao()!= null && !entity.getDataAquisicao().isEmpty()){          
////            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
////            java.sql.Date data = new java.sql.Date(format.parse(entity.getDataAquisicao()).getTime());
////            sql += " data_compra = '" + data + "',";
////        }
//        if (entity.getStatus() != null && !entity.getStatus().isEmpty()) {
//            sql += " status = '" + entity.getStatus() + "',";
//        }
//        if (entity.getDescricao() != null && !entity.getDescricao().isEmpty()) {
//            sql += " descricao = '" + entity.getDescricao() + "',";
//        }
//        sql += " id = id";
//
//        sql += " where id = '" + entity.getId() + "'";
//
//        System.out.println(sql);
//        PreparedStatement ps = conn.prepareStatement(sql);
//        ps.execute();
//        ps.close();
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String sql = "DELETE FROM item WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public String applyCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = " ";
        
        Long usuarioEQ = (Long) criteria.get(ItemCriteria.ID_USUARIO);
        if(usuarioEQ != null && usuarioEQ > 0){
            sql += " AND item.usuario_fk = " + usuarioEQ;
        }

        String nomeILike = (String) criteria.get(ItemCriteria.NOME_ILIKE);
        if (nomeILike != null && !nomeILike.isEmpty()) {
            sql += " AND item.nome ILIKE '%" + nomeILike + "%'";
        }
        
        String status = (String) criteria.get(ItemCriteria.STATUS_EQ);
        if(status != null && !status.isEmpty()){            
            sql += " AND item.status='"+status+"' ";
        }

        return sql;
    }

    @Override
    public Long countByCriteria(Connection conn, Map<Long, Object> criteria, Long limit, Long offset) throws Exception {
        Long count = null;
        String sql = "SELECT count(*) count FROM item WHERE 1=1";
        sql += applyCriteria(conn, criteria);
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            count = rs.getLong("count");
        }        
        return count;
    }

}
