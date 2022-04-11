-- Criando os scripts e constraints para a criação da base utilizando SQL.

CREATE DATABASE db_Formula1;

USE db_Formula1;

CREATE TABLE tb_Pais
(ID_Pais SMALLINT PRIMARY KEY NOT NULL,
NM_Pais VARCHAR(50) NOT NULL,
NR_Populacao INT NOT NULL);

CREATE TABLE tb_Equipe
(ID_Equipe SMALLINT PRIMARY KEY NOT NULL,
NM_Equipe VARCHAR(50) NOT NULL,
ID_Pais SMALLINT NOT NULL,
CONSTRAINT FK_tbPais_tbEquipe FOREIGN KEY (ID_Pais) REFERENCES tb_Pais(ID_Pais));

CREATE TABLE tb_Piloto
(ID_Piloto SMALLINT PRIMARY KEY UNIQUE NOT NULL,
NM_Piloto VARCHAR(80) NOT NULL,
DT_Nascimento DATE NOT NULL,
ID_Pais SMALLINT NOT NULL,
ID_Equipe SMALLINT NOT NULL,
CONSTRAINT FK_tbPais_tbPiloto FOREIGN KEY (ID_Pais) REFERENCES tb_Pais(ID_Pais),
CONSTRAINT FK_tbEquipe_tbPiloto FOREIGN KEY (ID_Equipe) REFERENCES tb_Equipe(ID_Equipe));

CREATE TABLE tb_Circuito
(ID_Circuito SMALLINT PRIMARY KEY NOT NULL,
NM_Circuito VARCHAR(100) NOT NULL,
NR_Extensao SMALLINT NOT NULL,
ID_Pais SMALLINT NOT NULL,
CONSTRAINT FK_tbPais_tbCircuito FOREIGN KEY (ID_Pais) REFERENCES tb_Pais(ID_Pais));

CREATE TABLE tb_Prova
(ID_Prova SMALLINT PRIMARY KEY NOT NULL,
DT_Prova DATE NOT NULL,
NM_Situacao VARCHAR(50) NOT NULL,
ID_Circuito SMALLINT NOT NULL,
CONSTRAINT FK_tbCircuito_tbProva FOREIGN KEY (ID_Circuito) REFERENCES tb_Circuito(ID_Circuito));

CREATE TABLE tb_Resultado
(ID_Prova SMALLINT NOT NULL,
ID_Piloto SMALLINT NOT NULL,
NR_Tempo_Prova TIME NOT NULL,
NR_Coloc_Final SMALLINT NOT NULL,
NR_Posicao_Grid SMALLINT NOT NULL,
NR_Melhor_Volta TIME NOT NULL,
CONSTRAINT FK_tbPiloto_tbResultado FOREIGN KEY (ID_Piloto) REFERENCES tb_Piloto(ID_Piloto),
CONSTRAINT FK_tbProva_tbResultado FOREIGN KEY (ID_Prova) REFERENCES tb_Prova(ID_Prova));

-- Inserindo dados.
-- Fonte: https://www.f1-fansite.com/pt/f1-teams/f1-teams-2021/
-- Fonte: https://pt.wikipedia.org/wiki/Campeonato_Mundial_de_F%C3%B3rmula_1_de_2021#Pilotos_e_equipes

INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (1, 'Abu Dhabi', 9599353);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (2, 'Alemanha', 83166711);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (3, 'Arábia Saudita', 33500000);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (4, 'Austrália', 25080200);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (5, 'Áustria', 8857960);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (6, 'Azerbaijão', 9511100);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (7, 'Barém', 1442659);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (8, 'Bélgica', 11420163);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (9, 'Brasil', 213317639);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (10, 'Canadá', 38005238);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (11, 'Catar', 2832000);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (12, 'Espanha', 47450795);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (13, 'Estados Unidos', 331893745);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (14, 'Finlândia', 5524574);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (15, 'França', 67348000);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (16, 'Holanda', 17100475);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (17, 'Hungria', 9797561);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (18, 'Ítalia', 60317116);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (19, 'Japão', 126440000);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (20, 'México', 126014024);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (21, 'Mônaco', 38400);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (22, 'Portugal', 10347892);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (23, 'Reino Unido', 63181775);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (24, 'Russia', 144526636);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (25, 'Suíça', 8508898);
INSERT INTO tb_Pais(ID_Pais, NM_Pais, NR_Populacao) VALUES (26, 'Turquia', 75627384);


INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (101, 'Alfa Romeo', 25);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (102, 'Alpha Tauri', 18);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (103, 'Alpine', 15);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (104, 'Aston Martin', 23);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (105, 'Ferrari', 18);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (106, 'Hass F1 Team', 13);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (107, 'McLaren', 23);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (108, 'Mercedes', 2);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (109, 'RedBull Racing', 5);
INSERT INTO tb_Equipe(ID_Equipe, NM_Equipe, ID_Pais) VALUES (110, 'Williams', 23);


INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (201, 'Lewis Hamilton', '1985-01-07', 23 , 108);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (202, 'Valtteri Bottas', '1989-08-28', 14, 108);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (203, 'Charles Leclerc', '1997-10-16', 21, 105);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (204, 'Carlos Sainz', '1994-09-01', 12, 105);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (205, 'Max Verstappen', '1997-09-30', 8, 109);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (206, 'Sergio Pérez', '1990-01-26', 20, 109);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (207, 'Fernando Alonso', '1981-07-29', 12, 103);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (208, 'Esteban Ocon', '1996-09-17', 15, 103);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (209, 'Mick Schumacher', '1999-03-22', 2, 106);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (210, 'Nikita Mazepin', '1999-03-02', 24, 106);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (211, 'Daniel Ricciardo', '1989-07-01', 4, 107);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (212, 'Lando Norris', '1999-10-13', 23, 107);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (213, 'Sebastian Vettel', '1987-07-03', 2, 104);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (214, 'Lance Stroll', '1998-10-29', 10, 104);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (215, 'Kimi Raikkonen', '1979-10-17', 14, 101);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (216, 'Antonio Giovinazzi', '1993-12-14', 18, 101);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (217, 'Pierre Gasly', '1996-02-07', 15, 102);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (218, 'Yuki tsunoda', '2000-05-11', 19, 102);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (219, 'George Russell', '1998-02-15', 23, 110);
INSERT INTO tb_Piloto(ID_Piloto, NM_Piloto, DT_Nascimento, ID_Pais, ID_Equipe) VALUES (220, 'Nicholas Latifi', '1995-06-29', 10, 110);


INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (301, 'Grande Prêmio do Barém', 5412, 7);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (302, 'Grande Prêmio da Emília-Romanha', 4959, 18);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (303, 'Grande Prêmio de Portugal', 4648, 22);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (304, 'Grande Prêmio da Espanha', 4675, 12);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (305, 'Grande Prêmio de Mônaco', 3340, 21);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (306, 'Grande Prêmio do Azerbaijão', 6003, 6);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (307, 'Grande Prêmio da França', 5842, 15);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (308, 'Grande Prêmio da Estíria', 4318, 5);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (309, 'Grande Prêmio da Áustria', 4318, 5);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (310, 'Grande Prêmio da Grã-Bretanha', 5891, 23);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (311, 'Grande Prêmio da Hungria', 4381, 17);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (312, 'Grande Prêmio da Bélgica', 7004, 8);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (313, 'Grande Prêmio dos Países Baixos', 4252, 16);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (314, 'Grande Prêmio da Itália', 5793, 18);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (315, 'Grande Prêmio da Rússia', 5853, 24);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (316, 'Grande Prêmio da Turquia', 5338, 26);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (317, 'Grande Prêmio dos Estados Unidos', 5513, 13);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (318, 'Grande Prêmio do México', 4304, 20);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (319, 'Grande Prêmio do Brasil', 4309, 9);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (320, 'Grande Prêmio do Catar', 5038, 11);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (321, 'Grande Prêmio da Arábia Saudita', 6175, 3);
INSERT INTO tb_Circuito(ID_Circuito, NM_Circuito, NR_Extensao, ID_Pais) VALUES (322, 'Grande Prêmio de Abu Dhabi', 5281, 1);


INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (401, '2021-03-28', 'Concluida', 301);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (402, '2021-04-18', 'Concluida', 302);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (403, '2021-05-02', 'Concluida', 303);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (404, '2021-05-09', 'Concluida', 304);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (405, '2021-05-23', 'Concluida', 305);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (406, '2021-06-06', 'Concluida', 306);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (407, '2021-06-20', 'Concluida', 307);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (408, '2021-06-27', 'Concluida', 308);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (409, '2021-07-04', 'Concluida', 309);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (410, '2021-07-18', 'Concluida', 310);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (411, '2021-08-01', 'Concluida', 311);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (412, '2021-08-29', 'Concluida', 312);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (413, '2021-09-05', 'Concluida', 313);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (414, '2021-09-12', 'Concluida', 314);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (415, '2021-09-26', 'Concluida', 315);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (416, '2021-10-10', 'Concluida', 316);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (417, '2021-10-24', 'Concluida', 317);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (418, '2021-11-07', 'Concluida', 318);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (419, '2021-11-14', 'Concluida', 319);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (420, '2021-11-21', 'Concluida', 320);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (421, '2021-12-05', 'Concluida', 321);
INSERT INTO tb_Prova(ID_Prova, DT_Prova, NM_Situacao, ID_Circuito) VALUES (422, '2021-12-12', 'Concluida', 322);


INSERT INTO tb_Resultado(ID_Prova, ID_Piloto, NR_Tempo_Prova, NR_Coloc_Final, NR_Posicao_Grid, NR_Melhor_Volta) VALUES (401, 201, '01:32:03.897', 1, 2, '00:01:29.385');
INSERT INTO tb_Resultado(ID_Prova, ID_Piloto, NR_Tempo_Prova, NR_Coloc_Final, NR_Posicao_Grid, NR_Melhor_Volta) VALUES (401, 205, '01:32:04.642', 2, 1, '00:01:29.385');
INSERT INTO tb_Resultado(ID_Prova, ID_Piloto, NR_Tempo_Prova, NR_Coloc_Final, NR_Posicao_Grid, NR_Melhor_Volta) VALUES (401, 202, '01:32:41.280', 3, 3, '00:01:29.385');
INSERT INTO tb_Resultado(ID_Prova, ID_Piloto, NR_Tempo_Prova, NR_Coloc_Final, NR_Posicao_Grid, NR_Melhor_Volta) VALUES (402, 205, '02:02:34.598', 1, 3, '00:01:29.385');
INSERT INTO tb_Resultado(ID_Prova, ID_Piloto, NR_Tempo_Prova, NR_Coloc_Final, NR_Posicao_Grid, NR_Melhor_Volta) VALUES (402, 201, '02:02:56.598', 2, 1, '00:01:15.609');
INSERT INTO tb_Resultado(ID_Prova, ID_Piloto, NR_Tempo_Prova, NR_Coloc_Final, NR_Posicao_Grid, NR_Melhor_Volta) VALUES (402, 212, '02:02:58.300', 3, 7, '00:01:29.385');
