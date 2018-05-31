#!/usr/bin/env python3

import json


def quote(string):
  return '"' + string + '"'


if __name__ == "__main__":
  with open("data/processed/licitacoes.json", 'r') as file:
    licitacoes = json.load(file)
  
  print(
    ",\n".join(
      map(
        lambda m: '(' +
                    quote(m["id"]) + ', ' +
                    str(m["modalidade"]) + ', ' +
                    str(m["uasg"]) +
                  ')',
        licitacoes
      )
    )
  )
