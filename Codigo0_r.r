#declaração de variável
x<-10
y<-11
a<-"torresmo"
print(x)
print(y)
print(a)
#condição----------------------------------------------
if(x>y){print("x maior que y")}else{print("y maior que x")}
#for---------------------------------------------------
for(i in 1:y){
    x<-x+1
    print("x está em : ")
    print(x)
}
#while------------------------------------------------
while (y<x) {
    y<-y+1
    print("y está em : ")
    print(y)
}
#limpar ambiente-----------------------------------------
rm(list=ls())

#criando vetor de exemplo--------------------------------
x <- 10:20 #crie um vetor com numeros de 10 a 20
print(x)

y <- c(1,2,3,4,6) #crie um vetor com numeros definidos
print(y)

pares <- seq(from = 2, to =20, by = 2) #de 2 a 20, pulando de 2 em 2
print(pares)

fracionarios <- seq (0, 1, 0.2) $de 0 a 1, pulando de 0.2 em 0.2 - gerando uma sequencia
print (fracionarios)

#ler vetores
print(x[4])
print(y[3])
print(fracionarios[4])
#imprimindo o ultimo elelemtno do vetor pares: o valor que estiver na posição equivalente ao seu tamanho
print(pares[length(pares)])

#criar matrizes---------------------------------------

#Matriz 3x2 com numeros de 1 a 6 (preenchida por coluna)
matriz_coluna <- matriz(1:6, nrow = 3 , ncol = 2)
print(matriz_coluna)


#Matriz 3x2 preenchida por linha
matriz_linha <- matriz(1:6, nrow = 3, ncol = 2, byrow = TRUE)
print(matriz_linha)

# Matriz combinando colunas
vetor1 <- c(1,34,3)
vetor2 <- c(2,14,6)
matriz_cbind <- cbind(vetor1, vetor2)
print(matriz_cbind)

#ler matrizes
print(matriz_coluna[1,1]) #aqui a linha 0 e coluna 0 são 1 e 1
#ler matrizes
print(matriz_cbind[1,1]) #aqui a linha 0 e coluna 0 são 1 e 1

#adicionar bibliotecas (require e imports) e ler gráficos
require('plot3d')
seqi<-seq(-25,25,2)
seqj<-seq(-25,25,2)
M<-matriz(1,nrow=length(seqi),ncol=length(seqj))
ci<-0
for(i in seqi){
  ci<-ci+1
  cj<-0
  for(j in seqj){
    cj<-cj+1
    M[ci,cj]<-i^3+j^3+6*i*j
  }
}
persp3d(seqi,sqj,M,contour=T)
require('rgl')
plot3d(seqi,seqj,M)



#ler um arquivo

setwd("C:/Users/Usuario/Desktop/UniBH/Aula0") #direcione para a pasta do arquivo
data<-read.table(dataset_spam_r.txt")
data<-data[sample(1:nrow(data), lenght(1:nrow(data))), 1:ncol(data)]
print(tabela)
#salvar um arquivo
write.table(tabela, fila = "meus_dados.txt", sep = "\t", row.names = FALSE)