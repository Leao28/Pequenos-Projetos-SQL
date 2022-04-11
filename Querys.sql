-- Criando a query que apresenta Pilotos por Equipe.

USE db_Atividade1;

SELECT tb_equipe.NM_Equipe AS 'Nome da Equipe', tb_piloto.NM_Piloto AS 'Nome do Piloto'
FROM tb_equipe
INNER JOIN tb_piloto ON tb_equipe.ID_Equipe = tb_piloto.ID_Equipe
GROUP BY tb_piloto.NM_Piloto;

-- Criando a query que exibe a quantidade de pilotos por ano de nascimento, ordenando-os de forma ascendente

SELECT DATE_FORMAT(DT_Nascimento, '%Y') AS 'Data de Nascimento', COUNT(DATE_FORMAT(DT_Nascimento, '%Y')) AS 'Quantidade de Pilotos'
FROM tb_piloto 
GROUP BY DATE_FORMAT(DT_Nascimento, '%Y') 
ORDER BY DATE_FORMAT(DT_Nascimento, '%Y') ASC;

-- Criando a query que exibe o nome do piloto, o país de nascimento, nome da equipe, país da equipe, colocação final, nome do circuito e a data da realização da prova.

SELECT tb_piloto.NM_Piloto AS 'Nome do Piloto', tb_pais.NM_Pais AS 'País de Nascimento', 
tb_equipe.NM_Equipe AS 'Nome da Equipe', tp2.NM_Pais AS 'País da Equipe',
tb_resultado.NR_Coloc_Final AS 'Colocação Final', tb_circuito.NM_Circuito AS 'Nome do Circuito',
tb_prova.DT_Prova  AS 'Realização da Prova'
FROM tb_piloto
INNER JOIN tb_pais ON tb_piloto.ID_Pais = tb_pais.ID_Pais
INNER JOIN tb_equipe ON tb_piloto.ID_Equipe = tb_equipe.ID_Equipe
INNER JOIN tb_pais tp2 ON tp2.ID_Pais = tb_equipe.ID_Pais
INNER JOIN tb_resultado ON tb_piloto.ID_Piloto = tb_resultado.ID_Piloto
INNER JOIN (tb_prova tp3 INNER JOIN tb_circuito ON tp3.ID_Circuito = tb_circuito.ID_Circuito) ON tb_resultado.ID_Prova = tp3.ID_Prova
INNER JOIN tb_prova ON tb_prova.ID_Prova = tb_resultado.ID_Prova;
