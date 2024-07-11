DROP DATABASE IF EXISTS shopee;

CREATE DATABASE shopee;

\c shopee;

CREATE TABLE usuario (
    id serial primary key,
    nome character varying(100) not null,
    email character varying(100) unique,
    senha character varying(100),
    rua text,
    complemento text,
    bairro text,
    nro character varying(10),
    cep character(12)
);
INSERT INTO usuario (nome, senha) VALUES
('IGOR PEREIRA', md5('123'));

CREATE TABLE vendedor (
    id serial primary key,
    nome character varying(100) not null
);
INSERT INTO vendedor (nome) VALUES
('XIXIN LTDA'),
('xazan LTDA');

CREATE TABLE produto (
    id serial primary key,
    descricao text,
    preco money check (cast(preco as numeric(8,2)) >=0),
    estoque integer check (estoque >= 0)
);

INSERT INTO produto (descricao, preco, estoque) VALUES
('BATELIA 3000mHA', 1.99, 100);

CREATE TABLE produto_vendedor (
    produto_id integer references produto (id),
    vendedor_id integer references vendedor (id),
    primary key (produto_id, vendedor_id)
);
INSERT INTO produto_vendedor (produto_id, vendedor_id) VALUES
(1, 1),
(1, 2);

CREATE TABLE forma_pagamento (
    id serial primary key,
    nome text not null
);
INSERT INTO forma_pagamento (nome) VALUES
('PIX'),
('CARTÃO'),
('BOLETO');

CREATE TABLE pedido (
    id serial primary key,
    impostos money,
    usuario_id integer references usuario (id),
    forma_pagamento_id integer references forma_pagamento (id)
);
INSERT INTO pedido (usuario_id, forma_pagamento_id) VALUES
(1, 1);

CREATE TABLE item (
    id serial primary key,
    pedido_id integer references pedido (id),
    produto_id integer references produto (id),
    preco_unitario_momento money,
    qtde integer check (qtde > 0)
);
INSERT INTO item (pedido_id, produto_id, preco_unitario_momento, qtde) VALUES
(1, 1, 1.99, 2);
UPDATE produto SET estoque = estoque - 2 where id = 1;














