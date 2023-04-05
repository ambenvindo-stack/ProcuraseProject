--Base de dados: db_procurase.sql
--Open database server: /usr/local/mysql/bin/mysql -u root -p
--Start MySQL. sudo /usr/local/mysql/support-files/mysql.server start.
--Stop MySQL. sudo /usr/local/mysql/support-files/mysql.server stop.
--Restart MySQL. sudo /usr/local/mysql/support-files/mysql.server restart

DROP DATABASE IF EXISTS db_procurase;

CREATE DATABASE db_procurase;

USE db_procurase;

CREATE TABLE provincia(
	id_provincia INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_provincia)
);

INSERT INTO provincia (nome) VALUES ('Luanda');

CREATE TABLE municipio(
	id_municipio INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	id_provincia INT NOT NULL,
	PRIMARY KEY(id_municipio),
	FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia)
);

INSERT INTO municipio (nome, id_provincia) VALUES ('Luanda', 1);
INSERT INTO municipio (nome, id_provincia) VALUES ('Belas', 1);
INSERT INTO municipio (nome, id_provincia) VALUES ('Cazenga', 1);
INSERT INTO municipio (nome, id_provincia) VALUES ('Viana', 1);
INSERT INTO municipio (nome, id_provincia) VALUES ('Cacuaco', 1);
INSERT INTO municipio (nome, id_provincia) VALUES ('Icolo e Bengo', 1);
INSERT INTO municipio (nome, id_provincia) VALUES ('Quissama', 1);


CREATE TABLE comuna(
	id_comuna INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	id_municipio INT NOT NULL,
	PRIMARY KEY(id_comuna),
	FOREIGN KEY(id_municipio) REFERENCES municipio(id_municipio)
);

INSERT INTO comuna (nome, id_municipio) VALUES ('Luanda', 1);

CREATE TABLE bairro(
	id_bairro INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    id_comuna INT NOT NULL,
	PRIMARY KEY(id_bairro),
	FOREIGN KEY(id_comuna) REFERENCES comuna(id_comuna)
);

INSERT INTO bairro (nome, id_comuna) VALUES ('Maianga', 1);

CREATE TABLE morada(
	id_morada INT NOT NULL AUTO_INCREMENT,
	rua VARCHAR(255) NOT NULL,
	id_bairro INT NOT NULL,
	PRIMARY KEY(id_morada),
	FOREIGN KEY(id_bairro) REFERENCES bairro(id_bairro)
);

INSERT INTO morada (rua, id_bairro) VALUES ('Rua Comandante Valodia', 1);

CREATE TABLE sexo(
	id_sexo INT NOT NULL AUTO_INCREMENT,
	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_sexo)
);

INSERT INTO sexo (descricao) VALUES ('Masculino');
INSERT INTO sexo (descricao) VALUES ('Feminino');

CREATE TABLE pessoa(
	id_pessoa INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	id_sexo INT NOT NULL,
	data_nascimento date NOT NULL,
	id_morada INT NOT NULL,
	PRIMARY KEY(id_pessoa),
	FOREIGN KEY(id_sexo) REFERENCES sexo(id_sexo),
	FOREIGN KEY(id_morada) REFERENCES morada(id_morada)
);

CREATE TABLE estado(
	id_estado INT NOT NULL AUTO_INCREMENT,
 	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_estado)
);

INSERT INTO estado (descricao) VALUES ('Desaparecido(a)');
INSERT INTO estado (descricao) VALUES ('Encontrado(a)');

CREATE TABLE deficiencia(
	id_deficiencia INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_deficiencia)
);

INSERT INTO deficiencia (nome) VALUES ('Fisica');
INSERT INTO deficiencia (nome) VALUES ('Visual');
INSERT INTO deficiencia (nome) VALUES ('Auditiva');
INSERT INTO deficiencia (nome) VALUES ('Intelectual');
INSERT INTO deficiencia (nome) VALUES ('Psicossocial');
INSERT INTO deficiencia (nome) VALUES ('Multipla');

CREATE TABLE motivo_desaparecimento(
	id_motivo_desaparecimento INT NOT NULL AUTO_INCREMENT,
	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_motivo_desaparecimento)
);

INSERT INTO motivo_desaparecimento (descricao) VALUES ('Conflito familiar');
INSERT INTO motivo_desaparecimento (descricao) VALUES ('Uso de drogas');
INSERT INTO motivo_desaparecimento (descricao) VALUES ('Uso de alcool');
INSERT INTO motivo_desaparecimento (descricao) VALUES ('Maus tratos');
INSERT INTO motivo_desaparecimento (descricao) VALUES ('Abuso sexual');
INSERT INTO motivo_desaparecimento (descricao) VALUES ('Trabalho escravo');
INSERT INTO motivo_desaparecimento (descricao) VALUES ('Remocao de orgaos');
INSERT INTO motivo_desaparecimento (descricao) VALUES ('Adocao ilegal');


CREATE TABLE desaparecimento(
	id_desaparecimento INT NOT NULL AUTO_INCREMENT,
	id_pessoa INT NOT NULL,
	id_estado INT NOT NULL,
	id_deficiencia INT NOT NULL,
	id_motivo_desaparecimento INT NOT NULL,
	data_desaparecimento date NOT NULL,
    foto TEXT NOT NULL,
	nota VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_desaparecimento),
	FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa),
	FOREIGN KEY(id_estado) REFERENCES estado(id_estado),
	FOREIGN KEY(id_deficiencia) REFERENCES deficiencia(id_deficiencia),
	FOREIGN KEY(id_motivo_desaparecimento) REFERENCES motivo_desaparecimento(id_motivo_desaparecimento)	
);

CREATE TABLE grau_parentesco(
	id_grau_parentesco INT NOT NULL AUTO_INCREMENT,
	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_grau_parentesco)
);

INSERT INTO grau_parentesco (descricao) VALUES ('Avo');
INSERT INTO grau_parentesco (descricao) VALUES ('Avo');
INSERT INTO grau_parentesco (descricao) VALUES ('Pai');
INSERT INTO grau_parentesco (descricao) VALUES ('Mae');
INSERT INTO grau_parentesco (descricao) VALUES ('Irma');
INSERT INTO grau_parentesco (descricao) VALUES ('Irmao');
INSERT INTO grau_parentesco (descricao) VALUES ('Tio(a)');
INSERT INTO grau_parentesco (descricao) VALUES ('Primo(a)');
INSERT INTO grau_parentesco (descricao) VALUES ('Sobrinho(a)');
INSERT INTO grau_parentesco (descricao) VALUES ('Neto(a)');

CREATE TABLE contato_desaparecimento(
	id_contato_desaparecimento INT NOT NULL AUTO_INCREMENT,
	id_desaparecimento INT NOT NULL,
	nome_parente VARCHAR(255) NOT NULL,
	id_grau_parentesco INT NOT NULL,
	numero_telefone_1 INT NOT NULL,
	numero_telefone_2 INT NOT NULL,
	PRIMARY KEY(id_contatso_desaparecimento),
	FOREIGN KEY(id_desaparecimento) REFERENCES desaparecimento(id_desaparecimento),
	FOREIGN KEY(id_grau_parentesco) REFERENCES grau_parentesco(id_grau_parentesco)
);