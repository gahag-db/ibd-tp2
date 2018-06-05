SELECT Licitacoes.id
FROM Licitacoes
  INNER JOIN Modalidades ON (Licitacoes.modalidade = Modalidades.id) 
WHERE Modalidades.descricao = 'PREGÃO'
   OR Modalidades.descricao = 'TOMADA DE PREÇOS'
