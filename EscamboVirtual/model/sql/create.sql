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

create table item_imagem(
	hash varchar(32) not null,
	item_fk bigint not null,
	imagem bytea not null,
	extensao varchar(20),
	primary key(hash)
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
	status varchar(50) NOT NULL,
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

create table usuario_imagem(
	usuario_fk bigint not null,
	imagem bytea,
	primary key(usuario_fk)
);

CREATE OR REPLACE FUNCTION public.gerahash()
  RETURNS trigger AS
$BODY$
		DECLARE
			recurso_hash character varying := NULL;
			datahora timestamp := NULL;
		        count bigint := 0;
		BEGIN
			
			SELECT CURRENT_TIMESTAMP INTO datahora; 
			SELECT MD5((datahora)::text) INTO recurso_hash; 
			
			WHILE (SELECT COUNT(hash) > 0 FROM item_imagem WHERE hash = recurso_hash)
			LOOP
				SELECT CURRENT_TIMESTAMP INTO datahora; 
				SELECT MD5((datahora)::text || count)  INTO recurso_hash;
				count := count + 1;
			END LOOP;
			
			NEW.hash := recurso_hash;
						
			RETURN NEW;
		END;
	$BODY$
  LANGUAGE plpgsql;
  
CREATE TRIGGER trigger_gerahash
  BEFORE INSERT
  ON item_imagem
  FOR EACH ROW
  EXECUTE PROCEDURE gerahash();

alter table usuario_imagem add constraint usuario_imagem_usuario_fk foreign key (usuario_fk) references usuario(id) on update cascade on delete cascade;
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
alter table item_imagem add constraint item_imagem_item_fk foreign key (item_fk) references item(id) on update cascade on delete cascade;
ALTER TABLE oferta_item ADD CONSTRAINT oferta_item_oferta_fk FOREIGN KEY (oferta_fk) REFERENCES oferta(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE oferta_item ADD CONSTRAINT oferta_item_item_fk FOREIGN KEY (item_fk) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE localizacao ADD CONSTRAINT localizacao_estado_fk FOREIGN KEY (estado_fk) REFERENCES estado(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE localizacao ADD CONSTRAINT lcoalizacao_cidade_fk FOREIGN KEY (cidade_fk) REFERENCES cidade(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE localizacao ADD CONSTRAINT localizacao_usuario_fk FOREIGN KEY (usuario_fk) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE localizacao ADD CONSTRAINT localizacao_item_fk FOREIGN KEY (item_fk) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE cidade ADD CONSTRAINT cidade_estado_fk FOREIGN KEY (estado_fk) REFERENCES estado(id) ON UPDATE CASCADE ON DELETE SET NULL;



