CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    setor VARCHAR(100)
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(7,2),
    unidade VARCHAR(50),
    fornecedor VARCHAR(100),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, setor) VALUES
('Hidráulica', 'Tubos e Conexões'),
('Elétrica', 'Fiação e Iluminação'),
('Ferramentas', 'Manuais e Elétricas'),
('Pintura', 'Tintas e Acessórios'),
('Acabamento', 'Pisos e Revestimentos');

INSERT INTO tb_produtos (nome, preco, unidade, fornecedor, categoria_id) VALUES
('Torneira PVC', 110.00, 'unidade', 'Fortlev', 1),
('Fio 10mm', 145.00, 'rolo 100m', 'Corfio', 2),
('Broca de Aço 8mm', 32.50, 'unidade', 'Vonder', 3),
('Lata de Tinta Acrílica', 170.00, '18L', 'Suvinil', 4),
('Chave de Fenda', 25.00, 'unidade', 'Tramontina', 3),
('Piso Porcelanato 60x60', 210.00, 'caixa', 'Eliane', 5),
('Interruptor Simples', 70.00, 'unidade', 'Pial Legrand', 2),
('Tinta Spray', 55.00, '400ml', 'Tekbond', 4);

SELECT * FROM tb_produtos WHERE preco > 100.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.nome, tb_categorias.setor
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome, tb_categorias.setor
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Hidráulica';
