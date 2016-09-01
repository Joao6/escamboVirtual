package escambovirtual.model.dao;

import escambovirtual.model.base.BaseDAO;
import escambovirtual.model.criteria.UsuarioCriteria;
import escambovirtual.model.entity.Administrador;
import escambovirtual.model.entity.Anunciante;
import escambovirtual.model.entity.Usuario;
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

/**
 *
 * @author Joao
 */
public class UsuarioDAO implements BaseDAO<Usuario> {

    @Override
    public void create(Connection conn, Usuario entity) throws Exception {
        String sql = "INSERT INTO usuario(nome, apelido, senha, email, sexo, data_nascimento, perfil, telefone, data_cadastro) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING id;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setString(++i, entity.getApelido());
        ps.setString(++i, entity.getSenha());
        ps.setString(++i, entity.getEmail());

        if (entity.getSexo() != null) {
            ps.setString(++i, entity.getSexo());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        if (entity.getNascimento() != null) {
            //convertendo a string do formulario para o tipo date para salvar no banco
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            java.sql.Date data = new java.sql.Date(format.parse(entity.getNascimento()).getTime());
            ps.setDate(++i, data);
        } else {
            ps.setNull(++i, Types.DATE);
        }

        ps.setInt(++i, entity.getPerfil());

        if (entity.getTelefone() != null) {
            ps.setString(++i, entity.getTelefone());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }
        //setando a data de cadastro
        java.sql.Date data2 = new java.sql.Date(new java.util.Date().getTime());
        ps.setDate(++i, data2);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            entity.setId(rs.getLong("id"));
        }

        rs.close();
        ps.close();

        if (entity instanceof Administrador) {
            this.createAdministrador(conn, (Administrador) entity);
        } else if (entity instanceof Anunciante) {
            this.createAnunciante(conn, (Anunciante) entity);
        }
    }

    private void createAdministrador(Connection conn, Administrador entity) throws Exception {
        String sql = "INSERT INTO administrador(usuario_fk, cpf) VALUES (?, ?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setLong(++i, entity.getId());
        ps.setString(++i, entity.getCpf());
        ps.execute();
        ps.close();
    }

    private void createAnunciante(Connection conn, Anunciante entity) throws Exception {
        String sql = "INSERT INTO anunciante(usuario_fk, reputacao) VALUES (?, ?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setLong(++i, entity.getId());

        if (entity.getReputacao() != null) {
            ps.setInt(++i, entity.getReputacao());
        } else {
            ps.setNull(++i, Types.BIGINT);
        }
        ps.execute();
        ps.close();
    }

    @Override
    public Usuario readById(Connection conn, Long id) throws Exception {
        String query = "select usuario.*, administrador.usuario_fk administrador, anunciante.usuario_fk anunciante, administrador.cpf administrador_cpf, anunciante.reputacao anunciante_reputacao from usuario left join administrador on usuario.id=administrador.usuario_fk left join anunciante on usuario.id=anunciante.usuario_fk WHERE id=?";

        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        Usuario usuario = null;
        while (rs.next()) {
            if (rs.getLong("administrador") > 0) {
                usuario = new Administrador();
            } else {
                usuario = new Anunciante();
            }
            usuario.setId(rs.getLong("id"));
            usuario.setNome(rs.getString("nome"));
            usuario.setApelido(rs.getString("apelido"));
            usuario.setEmail(rs.getString("email"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setSexo(rs.getString("sexo"));
            //usuario.setNascimento(rs.getDate("data_nascimento"));
            usuario.setPerfil(rs.getInt("perfil"));
            usuario.setTelefone(rs.getString("telefone"));
            usuario.setData_cadastro(rs.getDate("data_cadastro"));

            if (usuario instanceof Anunciante) {
                Anunciante anunciante = (Anunciante) usuario;
                anunciante.setReputacao(rs.getInt("reputacao"));
            } else {
                Administrador administrador = (Administrador) usuario;
                administrador.setCpf(rs.getString("cpf"));
            }
        }
        rs.close();
        ps.close();
        return usuario;
    }

    @Override
    public List<Usuario> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "select usuario.*, anunciante.reputacao, administrador.cpf, anunciante.usuario_fk anunciante, administrador.usuario_fk administrador from usuario left join administrador on administrador.usuario_fk=usuario.id left join anunciante on anunciante.usuario_fk=usuario.id WHERE 1=1";
        
        List<Object> params = new ArrayList<>();

        String email = (String) criteria.get(UsuarioCriteria.USUARIO_EMAIL_EQ);
        if (email != null && !email.isEmpty()) {
            sql += " AND email=? ";
            params.add(email);
        }

        String senha = (String) criteria.get(UsuarioCriteria.USUARIO_SENHA_EQ);
        if (senha != null && !senha.isEmpty()) {
            sql += " AND senha=? ";
            params.add(senha);
        }                
        
        sql += applyCriteria(conn, criteria);
        
        PreparedStatement ps = conn.prepareStatement(sql);
        int x = 0;
        for (Object param : params) {
            ps.setObject(++x, param);
        }
        ResultSet rs = ps.executeQuery();

        List<Usuario> usuarioList = new ArrayList<>();
        while (rs.next()) {
            Usuario usuario = null;
            if (rs.getLong("administrador") > 0) {
                usuario = new Administrador();
            } else {
                usuario = new Anunciante();
            }
            usuario.setId(rs.getLong("id"));
            usuario.setNome(rs.getString("nome"));
            usuario.setApelido(rs.getString("apelido"));
            usuario.setEmail(rs.getString("email"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setSexo(rs.getString("sexo"));
            //usuario.setNascimento(rs.getDate("data_nascimento"));
            usuario.setPerfil(rs.getInt("perfil"));
            usuario.setTelefone(rs.getString("telefone"));
            usuario.setData_cadastro(rs.getDate("data_cadastro"));

            if (usuario instanceof Anunciante) {
                Anunciante anunciante = (Anunciante) usuario;
                anunciante.setReputacao(rs.getInt("reputacao"));
            } else {
                Administrador administrador = (Administrador) usuario;
                administrador.setCpf(rs.getString("cpf"));
            }
            usuarioList.add(usuario);
        }

        return usuarioList;
    }

    @Override
    public void update(Connection conn, Usuario entity) throws Exception {
        String sql = "UPDATE usuario SET nome=?, apelido=?, senha=?, email=?, sexo=?, data_nascimento=?, perfil=?, telefone=?, data_cadastro=? WHERE id=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setString(++i, entity.getApelido());
        ps.setString(++i, entity.getSenha());
        ps.setString(++i, entity.getEmail());

        if (entity.getSexo() != null) {
            ps.setString(++i, entity.getSexo());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        if (entity.getNascimento() != null) {
            //convertendo a string do formulario para o tipo date para salvar no banco
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            java.sql.Date data = new java.sql.Date(format.parse(entity.getNascimento()).getTime());
            ps.setDate(++i, data);
        } else {
            ps.setNull(++i, Types.DATE);
        }

        ps.setInt(++i, entity.getPerfil());

        if (entity.getTelefone() != null) {
            ps.setString(++i, entity.getTelefone());
        } else {
            ps.setNull(++i, Types.VARCHAR);
        }

        ///////////////
        /*IMAGEM DO USUARIO VAI AQUI*/
        ////////////////
        //setando a data de cadastro
        java.sql.Date data2 = new java.sql.Date(new java.util.Date().getTime());
        ps.setDate(++i, data2);

        ps.setLong(++i, entity.getId());

        ps.execute();
        ps.close();

        if (entity instanceof Administrador) {
            this.updateAdm(conn, (Administrador) entity);
        } else if (entity instanceof Anunciante) {
            this.updateAnunciante(conn, (Anunciante) entity);
        }
    }

    private void updateAdm(Connection conn, Administrador entity) throws SQLException {
        String sql = "UPDATE administrador SET cpf=? WHERE usuario_fk=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setString(++i, entity.getCpf());
        ps.setLong(++i, entity.getId());        
        ps.execute();
        ps.close();
    }

    private void updateAnunciante(Connection conn, Anunciante entity) throws SQLException {
        String sql = "UPDATE anunciante SET reputacao=? WHERE usuario_fk=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int i = 0;
        ps.setInt(++i, entity.getReputacao());
        ps.setLong(++i, entity.getId());        
        ps.execute();
        ps.close();
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String query = "DELETE FROM usuario WHERE id=?;";

        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public String applyCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String sql = "";        

        Boolean administrador = (Boolean) criteria.get(UsuarioCriteria.ADMINISTRADOR);
        if (administrador != null) {
            if (administrador) {
                sql += " and perfil=1";
            } else {
                sql += " and perfil=2";
            }
        }
        
        Boolean anunciante = (Boolean) criteria.get(UsuarioCriteria.ANUNCIANTE);
        if (anunciante != null) {
            if (anunciante) {
                sql += " and perfil=2";
            } else {
                sql += " and perfil=1";
            }
        }
       
        return sql;
    }

}
