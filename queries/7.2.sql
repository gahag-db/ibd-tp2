SELECT Contratos.id
FROM Contratos
WHERE NOT EXISTS (
  SELECT L.id
  FROM Licitacoes L, 
    Modalidades M WHERE L.modalidade = M.id
  AND Contratos.licitacao = L.id
    AND M.descricao = 'PREGÃO'
)
