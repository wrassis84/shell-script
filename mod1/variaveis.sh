#!/usr/bin/env bash 

# Quando usamos variáveis com espaços e quebras de linha...
NOME="William Ramos
de Assis Rezende"

# Nós precisamos usar aspas duplas para ler ou mostrar o valor das variáveis.
# Isso vai preservar os espaços e a formatação!
echo "$NOME"

NUMERO_1="24"
NUMERO_2="90"

TOTAL=$(($NUMERO_1+$NUMERO_2))

echo "$TOTAL"
