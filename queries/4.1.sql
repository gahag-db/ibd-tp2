SELECT Licitacoes.id
FROM Licitações, Modalidade
WHERE Licitacoes.modalidade = Modalidade.id 
  AND (Modalidade.nome ~* 'PREGÃO' OR Modalidade.nome ~* 'TOMADA DE PREÇOS')
