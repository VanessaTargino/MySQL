CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    area_conhecimento VARCHAR(100)
);

CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(8,2),
    carga_horaria INT,
    plataforma VARCHAR(100),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, area_conhecimento) VALUES
('Programação', 'Tecnologia'),
('Design Gráfico', 'Criatividade'),
('Idiomas', 'Linguagem'),
('Marketing Digital', 'Comunicação'),
('Desenvolvimento Pessoal', 'Psicologia');

INSERT INTO tb_cursos (nome, preco, carga_horaria, plataforma, categoria_id) VALUES
('Java Completo', 950.00, 80, 'Alura', 1),
('Inglês Básico', 490.00, 60, 'Duolingo', 3),
('Photoshop Essencial', 670.00, 40, 'Udemy', 2),
('Curso de SEO', 510.00, 30, 'Rock Content', 4),
('Autoconhecimento e Mindfulness', 750.00, 25, 'ZenApp', 5),
('JavaScript Avançado', 890.00, 70, 'Rocketseat', 1),
('Espanhol do Zero', 650.00, 50, 'Babbel', 3),
('Design de Interfaces', 800.00, 45, 'Domestika', 2);

SELECT * FROM tb_cursos WHERE preco > 500.00;

SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT tb_cursos.*, tb_categorias.nome, tb_categorias.area_conhecimento
FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id;

SELECT tb_cursos.*, tb_categorias.nome, tb_categorias.area_conhecimento
FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Programação';
