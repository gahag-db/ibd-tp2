SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores
  INNER JOIN Contratos ON (Fornecedores.id = Contratos.fornecedor)
WHERE YEAR(Contratos.data) >= 2012 


