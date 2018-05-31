#!/usr/bin/env python3

import json


def quote(string):
  if string is None:
    return "null"
  
  return '"' + string + '"'


if __name__ == "__main__":
  with open("data/processed/orgaos.json", 'r') as file:
    orgaos = json.load(file)
  
  print(
    ",\n".join(
      map(
        lambda m: '(' +
                    str(m["id"]) + ', ' +
                    quote(m["nome"]) + ', ' +
                    quote(m["esfera"]) +
                  ')',
        orgaos
      )
    )
  )
