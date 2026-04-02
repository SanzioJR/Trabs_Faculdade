import csv

# 'with open' garante que o arquivo será fechado automaticamente
with open('Base-1.csv,'r', newline='', enconding='utf-8') as arquivo_csv:
    leitor_csv = csv.reader(arquivo_csv)
    matriz_lista_de_listas = list(leitor_csv)

#se quiser recomer o cabeçalho (primeira linha)
#matriz_lista_de_listas = list(leitor_csv)[1:] #ignora a primeira linha

print(matriz_lista_de_listas[1:]) #Imprima a linha 1
