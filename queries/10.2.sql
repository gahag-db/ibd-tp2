SELECT Fornecedores.id, Fornecedores.nome
FROM Fornecedores
EXCEPT (
  SELECT * FROM Fornecedores
	WHERE Fornecedores.uf = 'MG'
) AS _
