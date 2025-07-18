CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    tipo VARCHAR(100)
);

CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(6,2),
    tamanho VARCHAR(50),
    borda_recheada BOOLEAN,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, tipo) VALUES
('Tradicional', 'Salgada'),
('Especial', 'Salgada'),
('Doce', 'Sobremesa'),
('Vegetariana', 'Salgada'),
('Vegana', 'Especial');

INSERT INTO tb_pizzas (nome, preco, tamanho, borda_recheada, categoria_id) VALUES
('Margherita', 42.90, 'Média', true, 1),
('Quatro Queijos', 49.90, 'Grande', false, 2),
('Chocolate com Morango', 55.00, 'Média', true, 3),
('Brócolis com Catupiry', 48.00, 'Grande', false, 4),
('Pepperoni', 60.00, 'Gigante', true, 2),
('Banana com Canela', 50.00, 'Média', false, 3),
('Vegana Supreme', 65.90, 'Grande', true, 5),
('Mussarela', 45.00, 'Média', false, 1);

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT tb_pizzas.*, tb_categorias.nome, tb_categorias.tipo
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id;

SELECT tb_pizzas.*, tb_categorias.nome, tb_categorias.tipo
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Doce';




