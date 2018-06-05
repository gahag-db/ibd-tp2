SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores
WHERE Fornecedores.id NOT IN (
  SELECT Fornecedores.id
  FROM Fornecedores
	WHERE Fornecedores.uf = 'MG'
)
