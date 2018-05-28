#!/usr/bin/env bash

# fornecedores
jq '[ ._embedded.fornecedores[] | { "id": .id, "cnpj": .cnpj, "nome": .nome, "uf": .uf } ]' \
   data/original/fornecedores.json > data/processed/fornecedores.json

# licitacoes
jq '[ ._embedded.licitacoes[] | { "id": .identificador|tonumber, "modalidade": .modalidade, "uasg": .uasg } ]' \
   data/original/licitacoes.json > data/processed/licitacoes.json

# orgaos
jq '[ ._embedded.Orgaos[] | { "id": .codigo, "nome": .nome, "esfera": .codigo_tipo_esfera } ]' \
   data/original/orgaos.json > data/processed/orgaos.json

# uasgs
jq '[ ._embedded.uasgs[] | { "id": .id, "nome": .nome, "municipio": .municipio, "licitacoes": .licitacoes, "orgao": .orgao } ]' \
   data/original/uasgs.json > data/processed/uasgs.json

# contratos
jq '[ ._embedded.contratos[] | select((.licitacao_associada | try tonumber catch false) and (._links.fornecedor.href != null)) ]' data/original/contratos.json \
    | jq '[ .[] | { "licitacao": .licitacao_associada|tonumber, "fornecedor": ._links.fornecedor.href|split("/")[-1]|tonumber, "data": .data_assinatura } ]' \
    > data/processed/contratos.json
