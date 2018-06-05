SELECT Licitacoes.id
FROM Licitacoes, UASGs, Orgaos, Municipios
WHERE Licitacoes.uasg = UASGs.id
  AND UASGs.orgao = Orgaos.id
  AND UASGs.municipio = Municipios.id 
  AND Orgaos.nome = 'MINISTERIO DO TURISMO'
  AND Municipios.nome = 'BRASÍLIA'
