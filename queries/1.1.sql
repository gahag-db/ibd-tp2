SELECT Count(*)
FROM Licitacoes
  JOIN UASGs ON (Licitacoes.uasg = UASGs.id)
  JOIN Orgaos ON (UASGs.orgao = Orgaos.id)
WHERE Orgaos.nome = 'SENADO FEDERAL'
