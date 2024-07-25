DROP DATABASE IF EXISTS administradora_relacional;

CREATE DATABASE administradora_relacional;

\c administradora_relacional;

CREATE TABLE administradora (
    cnpj            character(14) primary key,
    nome            character varying(100) not null,
    nome_gerente    character varying(100),
    rua             character varying(100),
    bairro          character varying(100),
    cep             character(8),
    nro             character varying(8),
    complemento     character varying(100)
);
INSERT INTO administradora (cnpj, nome) values ('12312312312314', 'igor admin');

CREATE TABLE email (
    id serial primary key,
    email character varying(100) unique,
    administradora_cnpj character(14) references administradora (cnpj) ON DELETE CASCADE
);
INSERT INTO email (administradora_cnpj, email) values ('12312312312314', 'igor_admin@mikrus.net');


CREATE TABLE condominio (
    id serial primary key,
    nome text not null,
    rua character varying(100),
    bairro character varying(100),
    cep character(8),
    nro character varying(8),
    complemento character varying(100),
    administradora_cnpj character(14) references administradora (cnpj)  
      
);

CREATE TABLE unidade (
    id serial       primary key,
    bloco           character varying(100),
    nro             character varying(100),
    condominio_id   integer references condominio (id)
);

CREATE TABLE pessoa (
    id              serial primary key,
    cpf             character(11) unique,
    nome            character varying(100),
    data_nascimento date CHECK (extract(year from data_nascimento) >= 1900)
);
INSERT INTO pessoa (cpf, nome, data_nascimento) VALUES
('11111111111','IGOR PEREIRA', '1987-01-20');
INSERT INTO pessoa (cpf, nome, data_nascimento) VALUES
('22222222222','EDUARDO BRIÃO', '1900-12-24');
-- Select nome, extract(year from age(data_nascimento)) as idade from pessoa;


CREATE TABLE propriedade (
    unidade_id integer references unidade (id),
    pessoa_id integer references pessoa (id),
    primary key (unidade_id, pessoa_id)
);

CREATE TABLE locacao (
    unidade_id integer references unidade (id),
    pessoa_id integer references pessoa (id),
    primary key (unidade_id, pessoa_id)
);

