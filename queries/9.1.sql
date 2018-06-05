SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores
WHERE Fornecedores.id NOT IN (
  SELECT Fornecedores.id
  FROM Fornecedores
    INNER JOIN Contratos ON Fornecedores.id = Contratos.fornecedor
  WHERE Contratos.data < '2007-12-28'
)
