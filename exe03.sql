CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(6,2),
    estoque INT,
    fabricante VARCHAR(100),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos', 'Remédios controlados e não controlados'),
('Higiene', 'Produtos de higiene pessoal'),
('Cosméticos', 'Beleza e cuidados'),
('Vitaminas', 'Suplementos e complexos vitamínicos'),
('Infantil', 'Produtos para bebês e crianças');

INSERT INTO tb_produtos (nome, preco, estoque, fabricante, categoria_id) VALUES
('Paracetamol 500mg', 8.90, 100, 'Genérico', 1),
('Escova Dental Macia', 12.50, 200, 'Colgate', 2),
('Protetor Solar FPS 50', 55.00, 50, 'Nivea', 3),
('Shampoo Infantil', 25.90, 80, 'Johnson', 5),
('Vitamina C 1g', 35.00, 60, 'Cimed', 4),
('Base Líquida', 68.90, 30, 'Avon', 3),
('Creme Hidratante', 47.00, 45, 'Natura', 3),
('Dipirona Sódica', 6.50, 150, 'Genérico', 1);

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.nome, tb_categorias.descricao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome, tb_categorias.descricao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Cosméticos';

