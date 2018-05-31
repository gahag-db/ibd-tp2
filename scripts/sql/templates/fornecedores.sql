CREATE TABLE Fornecedores(
   id   INTEGER  NOT NULL PRIMARY KEY 
  ,cnpj VARCHAR(14)
  ,nome VARCHAR(80) NOT NULL
  ,uf   VARCHAR(2) NOT NULL
);
INSERT INTO Fornecedores(id,cnpj,nome,uf) VALUES
