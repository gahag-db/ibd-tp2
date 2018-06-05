SELECT Licitacoes.id
FROM Licitacoes
  JOIN UASGs ON (Licitacoes.uasg = UASGs.id)
  JOIN Orgaos ON (UASGs.orgao = Orgaos.id)
WHERE Orgao.nome ~* 'SENADO FEDERAL'
