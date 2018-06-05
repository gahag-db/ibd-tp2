SELECT Licitacoes.id,	COUNT(*)
FROM Licitacoes, Contratos 
WHERE Licitacoes.id = Contratos.licitacao
GROUP BY Licitacoes.id
  HAVING COUNT(*) > 2
ORDER BY COUNT(*) DESC
