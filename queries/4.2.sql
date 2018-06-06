  SELECT UASGs.nome
  FROM Licitacoes INNER JOIN UASGs
    ON Licitacoes.uasg = UASGs.id
    INNER JOIN Municipios
    ON UASGs.municipio = Municipios.id
    INNER JOIN Modalidades
    ON Modalidades.id = Licitacoes.modalidade
    AND Municipios.nome = 'Belo Horizonte'
    AND Modalidades.descricao = 'PREGÃO'
