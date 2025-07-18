CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    tipo VARCHAR(100)
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(6,2),
    peso_kg DECIMAL(5,2),
    origem VARCHAR(100),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, tipo) VALUES
('Carnes Bovinas', 'Carne vermelha'),
('Carnes Suínas', 'Carne branca'),
('Aves', 'Frango e derivados'),
('Embutidos', 'Processados'),
('Miúdos', 'Órgãos e partes internas');

INSERT INTO tb_produtos (nome, preco, peso_kg, origem, categoria_id) VALUES
('Picanha', 120.00, 1.0, 'Frigorífico Sul', 1),
('Alcatra', 95.00, 1.2, 'Frigorífico Sul', 1),
('Costela Suína', 75.00, 1.5, 'Frigorífico São João', 2),
('Linguiça Toscana', 52.00, 1.0, 'Frigorífico São João', 4),
('Frango Inteiro', 55.00, 2.0, 'Granja Feliz', 3),
('Coração de Frango', 58.00, 1.0, 'Granja Feliz', 5),
('Filé de Peito', 60.00, 1.0, 'Granja Feliz', 3),
('Linguiça Calabresa', 50.00, 1.0, 'Frigorífico São João', 4);


SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.nome, tb_categorias.tipo
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome, tb_categorias.tipo
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Aves' OR tb_categorias.nome = 'Miudos';
