SELECT Contratos.id
FROM Contratos,Licitacoes, Modalidade 
WHERE Contratos.licitacao = Licitacoes.id
  AND Licitacoes.modalidade = Modalidade.id
  AND Modalidade.descricao != 'PREGÃO'
