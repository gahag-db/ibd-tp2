SELECT Count(*)
FROM Contratos
WHERE NOT EXISTS (
  SELECT L.id
  FROM Licitacoes L
    INNER JOIN Modalidades M ON L.modalidade = M.id
  WHERE Contratos.licitacao = L.id
    AND M.descricao = 'PREGÃO'
)
