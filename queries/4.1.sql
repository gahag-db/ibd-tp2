  SELECT DISTINCT UASGs.nome
  FROM Licitacoes, UASGs, Municipios, Modalidades
  WHERE Licitacoes.uasg = UASGs.id
    AND UASGs.municipio = Municipios.id    
    AND Modalidades.id = Licitacoes.modalidade
    AND Licitacoes.uasg = UASGs.id
    AND Municipios.nome = 'Belo Horizonte'
    AND Modalidades.descricao = 'PREGÃO'
