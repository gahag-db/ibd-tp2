DROP TABLE IF EXISTS Contratos;
CREATE TABLE Contratos(
   licitacao  BIGINT  NOT NULL
  ,fornecedor INTEGER  NOT NULL
  ,data       DATE  NOT NULL
  ,PRIMARY KEY(licitacao,fornecedor)
  ,FOREIGN KEY (licitacao) REFERENCES Licitacoes(id)
  ,FOREIGN KEY (fornecedor) REFERENCES Fornecedores(id)
);
INSERT INTO Contratos(licitacao,fornecedor,data) VALUES
