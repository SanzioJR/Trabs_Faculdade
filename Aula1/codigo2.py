
"ler um arquivo externo"

f=open("teste 1.txt","r")
lines=f.readlines()
result=[]
for x in lines:
    result.append(x.split('\n'))
f.close()

print(lines)
print(result)




f=open("dataset_spam_r.txt","r")
lines=f.readlines()
result=[]
for x in lines:
   result.append(x.split('\n'))
f.close()

print(lines)
print(result)

textfile=open('dataset_spam_r.txt')
data = []
for line in textfile:
   row_data = line.strip("\n").split()
   for i, item in enumerate(row_data):
      try:
         row_data[i] = float(item)
      except ValueError:
         pass
   data.append(row_data)

print(data)

import numpy
w=numpy.array(data)
"imprima a base de dados"
print(w)
"imprima o taamanho da base de dados"
print(w.shape)
"imprima o dado da linha 34 na coluna 57"
print(w[34][57])




ww=w.T
"Os dados em linha: linha -> variável, coluna -> amostra"
"a matriz está tranposta graças a numpy"

"Escrever um arquivo externo"
matriz=str(ww)
arquivo=open('python.txt','w')
arquivo.write(matriz)
arquivo.close()