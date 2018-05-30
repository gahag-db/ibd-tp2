#!/usr/bin/env bash

apis=(
  "fornecedores"
  "licitacoes"
  "orgaos"
  "uasgs"
  "contratos"
  "municipios"
)


function query-fornecedores {
  jq '[ ._embedded.fornecedores[] | { "id": .id, "cnpj": .cnpj, "nome": .nome, "uf": .uf } ]' $@
}

function query-licitacoes {
  jq '[ ._embedded.licitacoes[] | { "id": .identificador|tonumber, "modalidade": .modalidade, "uasg": .uasg } ]' $@
}

function query-orgaos {
  jq '[ ._embedded.Orgaos[] | { "id": .codigo, "nome": .nome, "esfera": .codigo_tipo_esfera } ]' $@
}

function query-uasgs {
  jq '[ ._embedded.uasgs[] | { "id": .id, "nome": .nome, "municipio": .id_municipio, "cep": .cep, "orgao": .id_orgao } ]' $@
}

function query-contratos {
  jq '[ ._embedded.contratos[] | select((.licitacao_associada | try tonumber catch false) and (._links.fornecedor.href != null)) ]' $@ \
    | jq '[ .[] | { "licitacao": .licitacao_associada|tonumber, "fornecedor": ._links.fornecedor.href|split("/")[-1]|tonumber, "data": .data_assinatura } ]'
}

function query-municipios {
  jq '[ ._embedded.municipios[] | { "id": .id, "nome": .nome, "nome_uf": .nome_uf, "sigla_uf": .sigla_uf } ]' $@
}


for api in ${apis[@]}; do
  {
    {
      echo "["
      for f in data/original/$api/*.json; do
        query-$api $f | sed '1d; $d'
        printf ','
      done
    } | sed '$d'
    echo "]"
  } > data/processed/$api.json
done
