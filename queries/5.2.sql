SELECT Licitacoes.id
FROM Licitacoes
  INNER JOIN UASGs ON (Licitacoes.uasg = UASGs.id)
  INNER JOIN Orgaos ON (UASGs.orgao = Orgaos.id)
  INNER JOIN Municipios ON (UASGs.municipio = Municipios.id)
WHERE Orgaos.nome ~* 'MINISTERIO DO TURISMO'
  AND Municipios.nome = 'BRASÍLIA'
