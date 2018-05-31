CREATE TABLE Municipios(
   id       INTEGER  NOT NULL PRIMARY KEY 
  ,nome     VARCHAR(40) NOT NULL
  ,nome_uf  VARCHAR(19) NOT NULL
  ,sigla_uf VARCHAR(2) NOT NULL
);
INSERT INTO Municipios(id,nome,nome_uf,sigla_uf) VALUES
