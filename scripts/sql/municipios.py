#!/usr/bin/env python3

import json


def quote(string):
  return '"' + string + '"'


if __name__ == "__main__":
  with open("data/processed/municipios.json", 'r') as file:
    municipios = json.load(file)
  
  print(
    ",\n".join(
      map(
        lambda m: '(' +
                    str(m["id"]) + ', ' +
                    quote(m["nome"]) + ', ' +
                    quote(m["nome_uf"]) + ', ' +
                    quote(m["sigla_uf"]) +
                  ')',
        municipios
      )
    )
  )
