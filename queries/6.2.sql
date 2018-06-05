SELECT Licitacoes.id, COUNT(*)
FROM Licitacoes
  INNER JOIN Contratos ON (Licitacoes.id = Contratos.licitacao)
GROUP BY Licitacoes.id
  HAVING COUNT(*) > 2
ORDER BY COUNT(*) DESC
