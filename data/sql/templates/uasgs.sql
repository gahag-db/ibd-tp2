DROP TABLE IF EXISTS UASGs;
CREATE TABLE UASGs(
   id        INTEGER  NOT NULL PRIMARY KEY 
  ,nome      VARCHAR(50) NOT NULL
  ,municipio INTEGER 
  ,cep       VARCHAR(8) NOT NULL
  ,orgao     INTEGER
  ,FOREIGN KEY (municipio) REFERENCES Municipios(id)
  ,FOREIGN KEY (orgao) REFERENCES Orgaos(id)
);
INSERT INTO UASGs(id,nome,municipio,cep,orgao) VALUES
