SELECT Contratos.id
FROM Contratos
  INNER JOIN Licitacoes ON (Contratos.licitacao = Licitacoes.id)
  INNER JOIN Modalidade ON (Licitacoes.modalidade = Modalidade.id)
WHERE Modalidade.descricao != 'PREGÃO'
