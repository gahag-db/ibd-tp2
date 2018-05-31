#!/usr/bin/env python3

import json


def quote(string):
  return '"' + string + '"'


if __name__ == "__main__":
  with open("data/processed/modalidades.json", 'r') as file:
    modalidades = json.load(file)
  
  print(
    ",\n".join(
      map(
        lambda m: '(' +
                    str(m["id"]) + ', ' +
                    quote(m["descricao"]) +
                  ')',
        modalidades
      )
    )
  )
