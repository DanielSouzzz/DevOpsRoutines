#!/bin/bash

output_file="/home/daniel/Estudos/cursoDevOps/top_processes_$(date +\%Y\%m\%d_\%H\%M).txt"

# Adiciona cabeçalho manualmente
echo "PID %MEM USER COMMAND" > "$output_file"

# Coleta informações dos processos e adiciona ao arquivo
ps -e -o pid,%mem,user,comm --sort=-%mem | head -n 11 >> "$output_file"
