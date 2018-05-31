#!/usr/bin/env bash

tables=(
  "fornecedores"
  "licitacoes"
  "orgaos"
  "uasgs"
  "contratos"
  "municipios"
  "modalidades"
)

for table in "${tables[@]}"; do
  {
    cat scripts/sql/templates/$table.sql
    scripts/sql/$table.py
    echo ';'
  } > data/sql/$table.sql
done
