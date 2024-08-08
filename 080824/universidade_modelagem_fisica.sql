DROP DATABASE IF EXISTS universidade;

CREATE DATABASE universidade;

\c universidade;

CREATE TABLE departamento (
    id serial primary key,
    nome text not null
);
INSERT INTO departamento (nome) VALUES ('COMPUTAÇÃO');

CREATE TABLE nivel (
    id serial primary key,
    nome text not null
);
INSERT INTO nivel (nome) VALUES ('GRADUAÇÃO');

CREATE TABLE turno (
    id serial primary key,
    descricao text not null
);
INSERT INTO turno (descricao) VALUES ('NOTURNO');

CREATE TABLE curso (
    id serial primary key,
    nome character varying(255) not null,
    
    nivel_id integer references nivel (id),
    
    turno_id integer,
    FOREIGN KEY (turno_id) REFERENCES turno (id),
    
    departamento_id integer references departamento (id)
    
);
INSERT INTO curso (nome, nivel_id, turno_id, departamento_id) VALUES
('TADS', 1, 1, 1);

CREATE TABLE disciplina (
    id serial primary key,
    nome character varying(255) not null,
    ementa text not null,
    carga_horaria integer check (carga_horaria > 0),
    creditos integer check (creditos > 0),
    semestre integer check (semestre >= 1),
    curso_id integer references curso (id)
);
INSERT INTO disciplina (nome, ementa, carga_horaria, creditos, semestre, curso_id) VALUES
('SISTEMAS DE INFORMAÇÃO', 'COISA DA CIBELE', 100, 4, 1, 1),
('PROJETO E MODELAGEM DE BANCO DE DADOS', 'COISAS DO IGOR', 50, 2, 2, 1);

CREATE TABLE pre_requisito (
    disciplina_id integer references disciplina (id),
    disciplina_requisito_id integer references disciplina (id),
    primary key (disciplina_id, disciplina_requisito_id)
);
INSERT INTO pre_requisito (disciplina_id, disciplina_requisito_id) VALUES
(2, 1);







