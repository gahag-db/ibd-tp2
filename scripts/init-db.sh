#!/usr/bin/env bash

cat data/sql/fornecedores.sql \
    data/sql/modalidades.sql \
    data/sql/orgaos.sql \
    data/sql/municipios.sql \
    data/sql/uasgs.sql \
    data/sql/licitacoes.sql \
    data/sql/contratos.sql \
  | mysql -p$1 tp2
