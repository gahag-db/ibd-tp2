SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores
  LEFT JOIN (
    SELECT fornecedor, id
    FROM Contratos
    WHERE data < '2007-12-28'
  ) AS datab407 ON Fornecedores.id = datab407.fornecedor 
WHERE datab407.id IS NULL;
