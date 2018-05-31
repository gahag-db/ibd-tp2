#!/usr/bin/env python3

import json


def quote(string):
  if string is None:
    return "null"
  
  return '"' + string + '"'


if __name__ == "__main__":
  with open("data/processed/fornecedores.json", 'r') as file:
    fornecedores = json.load(file)
  
  print(
    ",\n".join(
      map(
        lambda m: '(' +
                    str(m["id"]) + ', ' +
                    quote(m["cnpj"]) + ', ' +
                    quote(m["nome"].replace("'", r"\'").replace('"', r'\"')) + ', ' +
                    quote(m["uf"]) +
                  ')',
        fornecedores
      )
    )
  )
