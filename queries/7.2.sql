SELECT Contratos.id
FROM Contratos,Licitacoes, Modalidades 
WHERE Contratos.licitacao = Licitacoes.id
  AND Licitacoes.modalidade = Modalidades.id
  AND Modalidades.descricao != 'PREGÃO'
