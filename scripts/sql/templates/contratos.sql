CREATE TABLE Contratos(
  id          VARCHAR(17) NOT NULL PRIMARY KEY
  ,licitacao  VARCHAR(17)  NOT NULL
  ,fornecedor INTEGER  NOT NULL
  ,data       DATE  NOT NULL
  ,FOREIGN KEY (licitacao) REFERENCES Licitacoes(id)
  ,FOREIGN KEY (fornecedor) REFERENCES Fornecedores(id)
);
INSERT INTO Contratos(id,licitacao,fornecedor,data) VALUES
