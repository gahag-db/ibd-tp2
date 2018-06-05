SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores
  RIGHT JOIN Contratos ON (Fornecedores.id = Contratos.fornecedor)
WHERE YEAR(Contratos.data) >= 2012
ORDER BY Contratos.data
GROUP BY Fornecedores.id 
