SELECT Licitacoes.id
FROM Licitações
  INNER JOIN Modalidade ON (Licitacoes.modalidade = Modalidade.id) 
WHERE Modalidade.nome ~* 'PREGÃO'
   OR Modalidade.nome ~* 'TOMADA DE PREÇOS' 
