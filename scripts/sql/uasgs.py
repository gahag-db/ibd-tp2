#!/usr/bin/env python3

import json


def string(s):
  if s is None:
    return "null"
  
  return str(s)

def quote(string):
  if string is None:
    return "null"
  
  return '"' + string + '"'


if __name__ == "__main__":
  with open("data/processed/uasgs.json", 'r') as file:
    uasgs = json.load(file)
  
  print(
    ",\n".join(
      map(
        lambda m: '(' +
                    str(m["id"]) + ', ' +
                    quote(m["nome"].replace('"', r'\"')) + ', ' +
                    string(m["municipio"]) + ', ' +
                    quote(m["cep"]) + ', ' +
                    string(m["orgao"]) +
                  ')',
        uasgs
      )
    )
  )
