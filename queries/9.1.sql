SELECT Fornecedores.nome, Fornecedores.id
FROM Fornecedores
  LEFT JOIN Contratos ON (Fornecedores.id = Contratos.fornecedor) 
WHERE Contratos.data < '2007-12-28'
  AND datab407.id IS NULL;
