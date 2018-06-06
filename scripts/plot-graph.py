#!/usr/bin/env python3

import numpy as np
import resource
import os
import subprocess
import sys
import matplotlib.pyplot as plt


def unique_filename(fname):
  return fname(next(filter(lambda ix: not os.path.isfile(fname(ix)), range(sys.maxsize))))

def query_str(ix):
  return str(ix[0]) + "." + str(ix[1])

def query_file(ix):
  return open("queries/" + query_str(ix) + ".sql", 'r')


def _run_query(ix):
  usage_before = resource.getrusage(resource.RUSAGE_CHILDREN)
  
  try:
    command_line = ["mysql", "-pn", "tp2"]
    
    with query_file(ix) as query:
      program = subprocess.run(
        command_line,
        stdin = query,
        stdout = subprocess.DEVNULL,
        stderr = subprocess.PIPE
      )
    
    if program.returncode != 0 or program.stderr:
      raise subprocess.SubprocessError(program.stderr.decode('utf8'))
    
  except subprocess.SubprocessError as e:
    print("Error: failed to execute.", file=sys.stderr)
    print(e, file=sys.stderr)
    sys.exit(1)
  
  usage_after = resource.getrusage(resource.RUSAGE_CHILDREN)
  
  # usage_after.ru_stime - usage_before.ru_stime
  return usage_after.ru_utime - usage_before.ru_utime


def plot(indexes, times1, times2):
  ticks = np.arange(len(indexes))
  width = 0.35
  plt.bar(ticks,         times1, width, color='xkcd:azure')
  plt.bar(ticks + width, times2, width, color='xkcd:maroon')
  
  plt.title("Tempo de execução")
  plt.ylabel("Tempo (s)")
  plt.xticks(ticks + width/2, indexes)
  
  plt.savefig(unique_filename(lambda i: "graph" + str(i) + ".svg"))


if __name__ == '__main__':
  indexes = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
  
  plot(
    indexes,
    list(map(lambda i: _run_query((i, 1)), indexes)),
    list(map(lambda i: _run_query((i, 2)), indexes))
  )
