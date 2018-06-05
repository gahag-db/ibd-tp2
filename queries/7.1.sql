SELECT Contratos.id
FROM Contratos
  INNER JOIN Licitacoes ON (Contratos.licitacao = Licitacoes.id)
  INNER JOIN Modalidades ON (Licitacoes.modalidade = Modalidades.id)
WHERE Modalidades.descricao != 'PREGÃO'
