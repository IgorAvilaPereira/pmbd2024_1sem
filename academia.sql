DROP DATABASE IF EXISTS academia;

CREATE DATABASE academia;

\c academia;

CREATE TABLE cliente (
    id serial primary key,
    nome character varying(150) not null,
    telefone character(15),
    cpf character(11) unique,
    data_nascimento date
);
INSERT INTO cliente (nome, cpf, data_nascimento) VALUES
('IGOR PEREIRA', '11111111111', '1987-01-20');

CREATE TABLE plano (
    id serial primary key,
    nome character varying(200),
    duracao integer check (duracao >= 1),
    valor money check (cast(valor as numeric(8,2)) >=0) default 0
);
CREATE TABLE cliente_plano (
    cliente_id integer references cliente (id),
    plano_id integer references plano (id),
    primary key (cliente_id, plano_id)
);

CREATE TABLE atividade (
    id serial primary key,
    nome character varying(100) not null,
    duracao time
);

CREATE TABLE plano_atividade (
    plano_id integer references plano (id),
    atividade_id integer references atividade(id),
    primary key (plano_id, atividade_id)
);

CREATE TABLE professor (
    id serial primary key,
    cpf character(11) unique,
    nome character varying(150) not null
);

CREATE TABLE dia_semana (
    id serial primary key,
    nome text not null
);

CREATE TABLE atividade_professor_dia_semana (
    atividade_id integer references atividade (id),
    professor_id integer references professor (id),
    dia_semana_id integer references dia_semana (id),
    horario time,
    primary key (atividade_id, professor_id, dia_semana_id, horario)
);




