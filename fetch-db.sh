#!/usr/bin/env bash

declare -A apis=( \
  ["fornecedores"]="http://compras.dados.gov.br/fornecedores/v1/fornecedores.json" \
  ["licitacoes"]="http://compras.dados.gov.br/licitacoes/v1/licitacoes.json" \
  ["orgaos"]="http://compras.dados.gov.br/licitacoes/v1/orgaos.json" \
  ["uasgs"]="http://compras.dados.gov.br/licitacoes/v1/uasgs.json" \
  ["contratos"]="http://compras.dados.gov.br/contratos/v1/contratos.json" \
  ["municipios"]="http://compras.dados.gov.br/fornecedores/v1/municipios.json" \
)

declare -A limits=( \
  ["fornecedores"]="$(seq 0 500 10000)" \
  ["licitacoes"]="$(seq 0 500 10000)" \
  ["orgaos"]="0 500" \
  ["uasgs"]="$(seq 0 500 10000)" \
  ["contratos"]="$(seq 0 500 10000)" \
  ["municipios"]="$(seq 0 500 5000)" \
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


for api in "${!apis[@]}"; do
  # for i in ${limits[$api]}; do
  #   curl "${apis[$api]}?offset=$i" | jq . > data/original/$api/$api-$i.json
  # done
  
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
