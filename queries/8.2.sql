SELECT Contratos.data, Count(*)
FROM Fornecedores,
  Contratos WHERE (Fornecedores.id = Contratos.fornecedor)
AND YEAR(Contratos.data) >= 2012 
