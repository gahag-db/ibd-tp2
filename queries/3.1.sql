SELECT Licitacoes.id
FROM Licitacoes, UASGs, Orgaos
WHERE Licitacoes.uasg = UASGs.id
  AND UASGs.orgao = Orgaos.id
  AND Orgaos.nome LIKE '%Turismo%'
