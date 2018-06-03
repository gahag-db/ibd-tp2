#!/usr/bin/env bash

mysql -p$1 tp2 <<EOF
  DROP TABLE IF EXISTS Contratos;
  DROP TABLE IF EXISTS Licitacoes;
  DROP TABLE IF EXISTS UASGs;
  DROP TABLE IF EXISTS Municipios;
  DROP TABLE IF EXISTS Orgaos;
  DROP TABLE IF EXISTS Fornecedores;
  DROP TABLE IF EXISTS Modalidades;
EOF
