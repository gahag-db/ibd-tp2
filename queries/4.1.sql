SELECT Licitacoes.id
FROM Licitacoes, Modalidades
WHERE Licitacoes.modalidade = Modalidades.id 
  AND (Modalidades.descricao = 'PREGÃO' OR Modalidades.descricao = 'TOMADA DE PREÇOS')
