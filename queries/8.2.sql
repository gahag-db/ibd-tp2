SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores, Contratos
WHERE Fornecedores.id = Contratos.fornecedor
  AND YEAR(Contratos.data) >= 2012
ORDER BY Contratos.data
GROUP BY Fornecedores.id 
