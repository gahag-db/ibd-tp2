#!/usr/bin/env python3

import json


lics_file = "data/processed/licitacoes.json"
conts_file = "data/processed/contratos.json"

def process_licitacoes(lics_file):
  with open(conts_file, 'r') as file:
    required_lics = set(c["licitacao"] for c in json.load(file))
  
  with open(lics_file, 'r') as file:
    lics = json.load(file)
  
  filtered_lics = [ lic for lic in lics if lic["id"] in required_lics ]
  
  with open(lics_file, 'w') as file:
    json.dump(filtered_lics, file, indent=2)


if __name__ == "__main__":
  process_licitacoes()
