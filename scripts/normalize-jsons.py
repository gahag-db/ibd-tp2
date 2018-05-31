#!/usr/bin/env python3

import json


class DataFile:
  def __init__(self, path):
    self.path = path
    with open(self.path, 'r') as file:
      self.data = json.load(file)
  
  def save(self, new_data=None):
    if new_data is not None:
      self.data = new_data
    
    with open(self.path, 'w') as file:
      json.dump(self.data, file, indent=2)


fornecedores = DataFile("data/processed/fornecedores.json")
modalidades  = DataFile("data/processed/modalidades.json")
licitacoes   = DataFile("data/processed/licitacoes.json")
contratos    = DataFile("data/processed/contratos.json")

  
def process_fornecedores():
  required = set(c["fornecedor_cnpj"] for c in contratos.data)
  fornecedores.save([
    forc for forc in fornecedores.data
          if forc["cnpj"] in required
  ])


def process_modalidades():
  for m in modalidades.data:
    m["descricao"] = m["descricao"].strip()
  
  modalidades.save()

    
def process_licitacoes():
  required = set(c["licitacao"] for c in contratos.data)
  licitacoes.save([
    lic for lic in licitacoes.data
          if lic["id"] in required
  ])


def process_contratos():
  def has_licitacao(id):
    try:
      next(
        filter(
          lambda l: l["id"] == id,
          licitacoes.data
        )
      )
      return True
    except StopIteration:
      return None
  
  def fornecedor_id(cnpj):
    try:
      return next(
        filter(
          lambda f: f["cnpj"] == cnpj,
          fornecedores.data
        )
      )["id"]
    except StopIteration:
      return None
  
  
  added = set()
  contratos.save([
    added.add(c["id"]) or {
      "id"         : c["id"],
      "licitacao"  : c["licitacao"],
      "fornecedor" : fid,
      "data"       : c["data"]
    }
    for c in contratos.data
    for fid in [fornecedor_id(c["fornecedor_cnpj"])]
      if fid is not None and has_licitacao(c["licitacao"]) and c["id"] not in added
  ])


if __name__ == "__main__":
  process_fornecedores()
  process_modalidades()
  process_licitacoes()
  process_contratos()
