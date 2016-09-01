CREATE TABLE usuario(
	id BIGSERIAL NOT NULL,
	nome VARCHAR(255) NOT NULL,
        apelido VARCHAR(100) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	sexo VARCHAR(20),
	data_nascimento DATE,
	perfil INTEGER NOT NULL,
	telefone VARCHAR(20),	
	imagem oid,
        data_cadastro DATE NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE anunciante(
    usuario_fk BIGINT NOT NULL,
    reputacao INTEGER,
    PRIMARY KEY(usuario_fk)
);

CREATE TABLE administrador(
    usuario_fk BIGINT NOT NULL,
    cpf VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY(usuario_fk)
);

CREATE TABLE comunicacao(
	usuario_fk BIGINT NOT NULL,
	item_fk BIGINT NOT NULL,
	PRIMARY KEY(usuario_fk,item_fk)
);

CREATE TABLE mensagem(
	id BIGSERIAL NOT NULL,
	data_hora DATE NOT NULL,
	texto VARCHAR NOT NULL,
	comunicacao_usuario_fk BIGINT,
	comunicacao_item_fk BIGINT,
	PRIMARY KEY(id)
);

CREATE TABLE item(
	id BIGSERIAL NOT NULL,
	nome VARCHAR(100) NOT NULL,
	data_compra DATE NOT NULL,
	data_hora_cadastro DATE NOT NULL,
	avaliacao_descricao VARCHAR(255),
	avaliacao_status VARCHAR(255),
	avaliacao_data_hora TIMESTAMP,
	avaliacao_usuario_fk BIGINT,
	status VARCHAR(30),
	descricao VARCHAR(255),
	usuario_fk BIGINT NOT NULL,
        interesse1 VARCHAR(50),
        interesse2 VARCHAR(50),
        interesse3 VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE item_imagem(
        item_fk BIGINT NOT NULL,
        imagem1 oid,
        imagem2 oid,
        imagem3 oid,
        imagem4 oid,
        imagem5 oid,
        PRIMARY KEY(item_fk)
);

CREATE TABLE item_palavra_chave(
	item_fk BIGINT NOT NULL,
	palavra_chave_fk BIGINT NOT NULL,
	PRIMARY KEY(item_fk,palavra_chave_fk)
);

CREATE TABLE palavra_chave(
	id BIGSERIAL NOT NULL,
	nome VARCHAR(40) NOT NULL UNIQUE,
	descricao VARCHAR(50),
	PRIMARY KEY(id)
);


CREATE TABLE oferta(
	id BIGSERIAL NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	item_fk BIGINT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE oferta_item(
	id BIGSERIAL NOT NULL,
	oferta_fk BIGINT NOT NULL,
	item_fk BIGINT NOT NULL,
	item VARCHAR(50),
	PRIMARY  KEY(id)
);

CREATE TABLE troca(
	avaliacao_nivel_satisfacao INT,
	avaliacao_data_hora TIMESTAMP,
	avaliacao_descricao VARCHAR(255),
	status INT NOT NULL,
	oferta_fk BIGINT NOT NULL,
	PRIMARY KEY(oferta_fk)
);


CREATE TABLE localizacao(
	id BIGSERIAL NOT NULL,
	nome VARCHAR(100),
	estado_fk BIGINT,
	cidade_fk BIGINT,
	bairro VARCHAR(100),
	rua VARCHAR(100),
	numero VARCHAR(10),
	usuario_fk  BIGINT,
	item_fk  BIGINT,
	PRIMARY KEY(id)
);


CREATE TABLE estado(
	id BIGSERIAL NOT NULL,
	UF VARCHAR(2) NOT NULL UNIQUE,
	nome VARCHAR (100) NOT NULL UNIQUE,
	--pais BIGINT NOT NULL,
	PRIMARY KEY(id)

);

CREATE TABLE cidade(
	id BIGSERIAL NOT NULL,
	nome VARCHAR(150) NOT NULL,
	estado_fk BIGINT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE log(
	id BIGSERIAL NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	usuario_fk BIGINT NOT NULL,
	PRIMARY KEY(id)
);
ALTER TABLE anunciante ADD CONSTRAINT anunciante_usuario_fk FOREIGN KEY (usuario_fk) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE administrador ADD CONSTRAINT administrador_usuario_fk FOREIGN KEY (usuario_fk) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE comunicacao ADD CONSTRAINT comunicacao_usuario_fk FOREIGN KEY (usuario_fk) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE CASCADE;-- ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE comunicacao ADD CONSTRAINT comunicacao_item_fk FOREIGN KEY (item_fk) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE log ADD CONSTRAINT log_usuario_fk FOREIGN KEY (usuario_fk) REFERENCES usuario(id);
ALTER TABLE item_palavra_chave ADD CONSTRAINT item_palavra_chave_item_fk FOREIGN KEY (item_fk) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE item_palavra_chave ADD CONSTRAINT item_palavra_chave_palavra_chave_fk FOREIGN KEY (palavra_chave_fk) REFERENCES palavra_chave(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE item ADD CONSTRAINT item_usuario_fk FOREIGN KEY (usuario_fk) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE item ADD CONSTRAINT item_usuario_avaliacao_fk FOREIGN KEY (avaliacao_usuario_fk) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE oferta ADD CONSTRAINT oferta_item_fk FOREIGN KEY (item_fk) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE troca ADD CONSTRAINT troca_oferta_fk FOREIGN KEY (oferta_fk) REFERENCES oferta(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE item_imagem ADD CONSTRAINT item_imagem_item_fk FOREIGN KEY (item_fk) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE oferta_item ADD CONSTRAINT oferta_item_oferta_fk FOREIGN KEY (oferta_fk) REFERENCES oferta(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE oferta_item ADD CONSTRAINT oferta_item_item_fk FOREIGN KEY (item_fk) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE localizacao ADD CONSTRAINT localizacao_estado_fk FOREIGN KEY (estado_fk) REFERENCES estado(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE localizacao ADD CONSTRAINT lcoalizacao_cidade_fk FOREIGN KEY (cidade_fk) REFERENCES cidade(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE localizacao ADD CONSTRAINT localizacao_usuario_fk FOREIGN KEY (usuario_fk) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE localizacao ADD CONSTRAINT localizacao_item_fk FOREIGN KEY (item_fk) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE cidade ADD CONSTRAINT cidade_estado_fk FOREIGN KEY (estado_fk) REFERENCES estado(id) ON UPDATE CASCADE ON DELETE SET NULL;



