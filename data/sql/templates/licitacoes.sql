DROP TABLE IF EXISTS Licitacoes;
CREATE TABLE Licitacoes(
   id         BIGINT  NOT NULL PRIMARY KEY 
  ,modalidade INTEGER  NOT NULL
  ,uasg       INTEGER  NOT NULL
  ,FOREIGN KEY (uasg) REFERENCES UASGs(id)
);
INSERT INTO Licitacoes(id,modalidade,uasg) VALUES
