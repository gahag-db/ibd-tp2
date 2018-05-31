#!/usr/bin/env bash

declare -A apis=(
  ["uasgs"]="http://compras.dados.gov.br/licitacoes/v1/uasgs.json"
  ["licitacoes"]="http://compras.dados.gov.br/licitacoes/v1/licitacoes.json"
  ["fornecedores"]="http://compras.dados.gov.br/fornecedores/v1/fornecedores.json"
  ["orgaos"]="http://compras.dados.gov.br/licitacoes/v1/orgaos.json"
  ["contratos"]="http://compras.dados.gov.br/contratos/v1/contratos.json"
  ["municipios"]="http://compras.dados.gov.br/fornecedores/v1/municipios.json"
)

declare -A limits=(
  ["fornecedores"]="$(seq 0 500 391825)"
  ["licitacoes"]="$(seq 0 500 1023999)"
  ["orgaos"]="0 500"
  ["uasgs"]="$(seq 0 500 28054)"
  ["contratos"]="$(seq 0 500 10000)"
  ["municipios"]="$(seq 0 500 5000)"
)


for api in "${!apis[@]}"; do
  for i in ${limits[$api]}; do
    curl "${apis[$api]}?offset=$i" | jq . > data/original/$api/$api-$i.json
  done
done
