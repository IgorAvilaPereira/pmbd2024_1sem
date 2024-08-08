-- sql: ddl (data definition language)
DROP DATABASE IF EXISTS concessionaria;

CREATE DATABASE concessionaria;

-- plpgsql
\c concessionaria;

CREATE TABLE cliente (
    cpf character (11) primary key,
    nome character varying(200) not null,
    estado_civil character varying (100),
    conjuge_nome character varying(100),
    conjuge_cpf character varying(100)
);

INSERT INTO cliente (cpf, nome) VALUES
('11111111111','IGOR AVILA PEREIRA');

CREATE TABLE marca (
    id serial primary key,
    nome character varying(200) not null
);
INSERT INTO marca (nome) VALUES
('VW'),
('FORD');

CREATE TABLE modelo (
    id serial primary key,
    nome text not null,
    ano integer check (ano >= 1900),
    marca_id integer references marca (id)
);
INSERT INTO modelo (nome, ano, marca_id) values
('GOL', 1990, 1);

CREATE TABLE veiculo (
    chassi character(17) primary key,
    ano integer,
    preco money check (cast(preco as numeric(8,2)) >= 0),
    km integer check (km >= 0),
    modelo_id integer references modelo (id)
);
INSERT INTO veiculo (chassi, ano, preco, km, modelo_id) VALUES
('12312312312312312', 1996, 1000, 15000, 1);


CREATE TABLE compra (
    id serial primary key,
    data_hora timestamp default current_timestamp,
    veiculo_chassi character(17) references veiculo (chassi),
    cliente_cpf character(11) references cliente (cpf) 
--    ON DELETE CASCADE
);
INSERT INTO compra (veiculo_chassi, cliente_cpf) values
('12312312312312312', '11111111111');

-- 
--select nome, 
--    case
--        when extract (month from data_nascimento) = 1 then 'legal janeirão'
--        when  extract (month from data_nascimento) = 2 then 'fevereiro n era'
--    else 'nao rolou preenchimento' 
--    end 
--    as dt_nascimento 
-- FROM cliente;
--
--
--1) compôs > por i.a
--2) normalizações: 1fn (colunas multivaloradas)
--    2fn (
--3) mapeamentos: er > relacional > fisica
--4) alter table, ilike, offset, limit, random(), case when, to_Char, extract,
--age, insert, update, where, in,  cast, concatenação ||, upper, lower, transação begin e commit;

--select nome || ' ' || to_char(data_nascimento, 'DD/MM/YYYY')  from cliente;
--concessionaria=# DELETE FROM cliente where nome ILIKE 'M%';
--concessionaria=# select lower(nome) from cliente where data_nascimento is null;
--BEGIN;
--DELETE FROM compra where cliente_cpf = '11111111111';
--DELETE FROM cliente where cpf = '11111111111';
--COMMIT;
--
--

