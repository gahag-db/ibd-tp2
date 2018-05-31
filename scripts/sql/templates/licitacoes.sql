CREATE TABLE Licitacoes(
   id         VARCHAR(17)  NOT NULL PRIMARY KEY 
  ,modalidade INTEGER  NOT NULL
  ,uasg       INTEGER  NOT NULL
  ,FOREIGN KEY (modalidade) REFERENCES Modalidades(id)
  ,FOREIGN KEY (uasg) REFERENCES UASGs(id)
);
INSERT INTO Licitacoes(id,modalidade,uasg) VALUES
