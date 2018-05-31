#!/usr/bin/env python3

import json


def quote(string):
  return '"' + string + '"'


if __name__ == "__main__":
  with open("data/processed/contratos.json", 'r') as file:
    contratos = json.load(file)
  
  print(
    ",\n".join(
      map(
        lambda m: '(' +
                    quote(m["id"]) + ', ' +
                    quote(m["licitacao"]) + ', ' +
                    str(m["fornecedor"]) + ', ' +
                    quote(m["data"]) +
                  ')',
        contratos
      )
    )
  )
