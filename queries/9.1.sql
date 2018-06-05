SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores
  LEFT JOIN Contratos ON (Fornecedores.id = Contratos.fornecedor) 
WHERE Contratos.data < '2007-12-28'
  AND Contratos.id IS NULL;
