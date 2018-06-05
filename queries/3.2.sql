SELECT Licitacoes.id, Licitacoes.nome
FROM Licitacoes
  INNER JOIN UASGs ON (Licitacoes.uasg = UASGs.id)
  INNER JOIN Orgaos ON (UASGs.orgao = Orgaos.id) 
WHERE Orgaos.nome ~* 'Turismo'
