SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores
  RIGHT JOIN Contratos ON (Fornecedores.id = Contratos.fornecedor)
WHERE YEAR(Contratos.data) >= 2012
GROUP BY Fornecedores.id 
ORDER BY Contratos.data
