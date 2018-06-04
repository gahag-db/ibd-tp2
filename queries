#1 ID das licitações que envolvem o órgão Senado Federal 
--Versão 1
SELECT Licitacoes.id FROM Licitacoes JOIN UASGs ON (Licitacoes.uasg = UASGs.id) JOIN Orgaos ON (UASGs.orgao = Orgaos.id)
WHERE Orgao.name ~* 'SENADO FEDERAL'
--Versão 2
SELECT Licitacoes.id FROM Licitacoes, UASGs, Orgaos 
WHERE Licitacoes.uasg = UASGs.id AND UASGs.orgao = Orgaos.id
AND Orgao.name ~* 'SENADO FEDERAL'
--Versão 3
SELECT Licitacoes.id FROM Licitacoes JOIN UASGs ON (Licitacoes.uasg = UASGs.id) 
WHERE UASGs.orgao = 2000 OR UASGs.orgao = 2001 OR UASGs.orgao = 2002
--Versão 4
SELECT Licitacoes.id FROM Licitacoes, UASGs
WHERE Licitacoes.uasg = UASGs.id
AND (UASGs.orgao = 2000 OR UASGs.orgao = 2001 OR UASGs.orgao = 2002)

#2 Todos os fornecedores do DF && #4 Todas as contratações de 2012
--Versão 1
SELECT Fornecedores.id AND Fornecedores.nome FROM Fornecedores, Contratos 
WHERE Fornecedores.id = Contratos.fornecedor
AND YEAR(Contratos.data) = 2012 AND Fornecedores.uf = 'DF'
GROUP BY Fornecedores.id
--Versão 2
SELECT Fornecedores.id AND Fornecedores.nome FROM Fornecedores RIGHT JOIN Contratos ON (Fornecedores.id = Contratos.fornecedor) 
WHERE YEAR(Contratos.data) = 2012 AND Fornecedores.uf = 'DF'
GROUP BY Fornecedores.id

#3 (ALTERADA )Todos as licitações envolvidas com órgãos que contém no Nome "Turismo" 
--Versão 1
SELECT Licitacoes.id AND Licitacoes.nome FROM Licitacoes, UASGs, Orgaos
WHERE Licitacoes.uasg = UASGs.id AND UASGs.orgao = Orgaos.id
AND Orgaos.nome ~* 'Turismo'
--Versão 2
SELECT Licitacoes.id AND Licitacoes.nome FROM Licitacoes LEFT JOIN UASGs ON (Licitacoes.uasg = UASGs.id) LEFT JOIN Orgaos ON (UASGs.orgao = Orgaos.id) 
WHERE Orgaos.nome ~* 'Turismo'

#5 A ID das licitações cuja modalidade é PREGÃO ou TOMADA DE PREÇOS
--Versão 1
SELECT Licitacoes.id FROM Licitações, Modalidade
WHERE Licitacoes.modalidade = Modalidade.id 
AND Licitacoes.modalidade = 2 OR Licitações.modalidade = 5 
--Versão 2
SELECT Licitacoes.id FROM Licitações LEFT JOIN Modalidade ON (Licitacoes.modalidade = Modalidade.id) 
WHERE Licitacoes.modalidade = 2 OR Licitações.modalidade = 5 
--Versão 3
SELECT Licitacoes.id FROM Licitações, Modalidade
WHERE Licitacoes.modalidade = Modalidade.id 
AND Modalidade.nome ~* 'PREGÃO' OR Modalidade.nome ~* 'TOMADA DE PREÇOS' 
--Versão 4
SELECT Licitacoes.id FROM Licitações LEFT JOIN Modalidade ON (Licitacoes.modalidade = Modalidade.id) 
WHERE Modalidade.nome ~* 'PREGÃO' OR Modalidade.nome ~* 'TOMADA DE PREÇOS' 

#6 A ID das licitações que envolvem o ministério do Turismo e cujo município é Brasília
--Versão 1
SELECT Licitacoes.id FROM Licitacoes, UASGs
WHERE Licitacoes.uasg = UASGs.id
AND UASGs.orgao = 54000 AND UASGs.municipio = 97012
--Versão 2
SELECT Licitacoes.id FROM Licitacoes JOIN UASGs ON (Licitacoes.uasg = UASGs.id)
WHERE UASGs.orgao = 54000 AND UASGs.municipio = 97012
--Versão 3
SELECT Licitacoes.id FROM Licitacoes, UASGs, Orgaos, Municipios
WHERE Licitacoes.uasg = UASGs.id
AND UASGs.orgao = Orgaos.id
AND UASGs.municipio = Municipios.id 
AND Orgaos.nome ~* 'MINISTERIO DO TURISMO' AND Municipios.nome = 'BRASÍLIA'
--Versão 4
SELECT Licitacoes.id FROM Licitacoes JOIN UASGs ON (Licitacoes.uasg = UASGs.id) JOIN Orgaos ON (UASGs.orgao = Orgaos.id) JOIN Municipios ON (AND UASGs.municipio = Municipios.id )
WHERE AND Orgaos.nome ~* 'MINISTERIO DO TURISMO' AND Municipios.nome = 'BRASÍLIA'

#7 A ID das licitações que envolvem dois ou mais contratos (não sei se tá certo)
--Versão 1
SELECT Licitacoes.id,	
COUNT(id) FROM Licitacoes, Contratos 
WHERE Licitacoes.id = Contratos.licitacao
GROUP BY Licitacoes.id
HAVING   COUNT(Licitacoes.id) > 2
ORDER BY COUNT(Licitacoes.id) DESC
--Versão 2
SELECT Licitacoes.id, 
COUNT(Licitacoes.id) FROM Licitacoes RIGHT JOIN Contratos ON (Licitacoes.id = Contratos.licitacao)
GROUP BY Licitacoes.id
HAVING   COUNT(Licitacoes.id) > 2
ORDER BY COUNT(Licitacoes.id) DESC

#8 A ID das contratações que nao possuem licitações cuja modalidade possui a descrição pregão
--Versão 1
SELECT Contratos.id FROM Contratos JOIN Licitacoes ON (Contratos.licitacao = Licitacoes.id) JOIN Modalidade ON (Licitacoes.modalidade = Modalidade.id)
WHERE Modalidade.descricao != 'PREGÃO'
--Versão 2
SELECT Contratos.id FROM Contratos,Licitacoes, Modalidade 
WHERE Contratos.licitacao = Licitacoes.id AND Licitacoes.modalidade = Modalidade.id
AND Modalidade.descricao != 'PREGÃO'
--Versão 3
SELECT Contratos.id FROM Contratos JOIN Licitacoes ON (Contratos.licitacao = Licitacoes.id) 
WHERE Licitacoes.modalidade != 5
--Versão 4
SELECT Contratos.id FROM Contratos,Licitacoes
WHERE Contratos.licitacao = Licitacoes.id 
AND Licitacoes.modalidade != 5

#9 Que fornecedores (id e nome) não estão em nenhum contrato que tenha iniciado em 2012?
--Versão 1
SELECT Fornecedores.id, Fornecedores.nome FROM Fornecedores RIGHT JOIN Contratos ON (Fornecedores.id = Contratos.fornecedor)
WHERE YEAR(Contratos.data) >= 2012
ORDER BY Contratos.data
GROUP BY Fornecedores.id 
--Versão 2
SELECT Fornecedores.id, Fornecedores.nome FROM Fornecedores, Contratos
WHERE Fornecedores.id = Contratos.fornecedor
AND YEAR(Contratos.data) >= 2012
ORDER BY Contratos.data
GROUP BY Fornecedores.id 

#10 Selecione os id e o nome dos forncedores que não estão em  contratos iniciados antes de '2007-12-28':
--Versão 1
SELECT Fornecedores.nome, Fornecedores.id FROM Fornecedores LEFT JOIN Contratos ON (Fornecedores.id = Contratos.fornecedor) 
WHERE Contratos.data < '2007-12-28'
AND datab407.id is null;
--Versão 2
SELECT Fornecedores.nome, Fornecedores.id FROM Fornecedores LEFT JOIN 
(SELECT fornecedor, id FROM Contratos WHERE data < '2007-12-28') as datab407 ON Fornecedores.id = datab407.fornecedor 
WHERE datab407.id is null;

#11 Que forncedores não vem de MG?
--Versão 1
SELECT Fornecedores.id, Fornecedores.nome FROM Fornecedores
WHERE Fornecedores.uf != 'MG'
--Versão 2 (não sei qual tá certo)
--esse
SELECT Fornecedores.id, Fornecedores.nome - 
	(SELECT * FROM Fornecedores
	WHERE Fornecedores.uf = 'MG')
FROM Fornecedores
--ou esse
SELECT Fornecedores.id, Fornecedores.nome FROM Fornecedores - (SELECT * FROM Fornecedores WHERE Fornecedores.uf = 'MG')
