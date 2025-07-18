USE db_loja_games;

CREATE TABLE tb_classes(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    tipo VARCHAR (255),
    PRIMARY KEY (id)
);

CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT,
    PRIMARY KEY (id),
    nome VARCHAR(200),
    poder_ataque INT,
    poder_defesa INT,
    nivel INT,
    classe_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome, tipo ) VALUES
('Arqueiro', 'Ataque à distância'),
('Guerreiro', 'Combate corpo a corpo'),
('Mago', 'Magia'),
('Cavaleiro', 'Tanque'),
('Assassino', 'Dano crítico');

SELECT * FROM tb_classes;

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Tamgoshi', 50, 30, 10, 4),
('Tânatos', 30, 10, 9, 1),
('Legolas', 30, 10, 9, 1),
('Morfeu', 15, 40, 9, 3),
('Thanos', 50, 15, 9, 2),
('Bilbo', 30, 5, 9, 5),
('Ruprest', 40, 40, 9, 4),
('Arthemis', 40, 10, 10, 5);

SELECT * FROM tb_personagens;

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT tb_personagens.*, tb_classes.nome, tb_classes.tipo
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id;

SELECT tb_personagens.*, tb_classes.nome
FROM tb_personagens 
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.nome = 'Arqueiro';



