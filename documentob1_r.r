rm(list=ls()) #limpa ambiente
setwd("C:/Users/Usuario/Desktop/UniBH/Aula1")
data<-read.csv("Base-1-Numerica.csv")
data<- data[sample(1:nrow(data),length(1:nrow(data)), 1:ncol(data))]
dim(data)
media=mean(data1[,17]) #Média
media
desvio=sd(data1[,17]) #devio padrão
desvio
variancia=var(data1[,17]) #Variancia
variancia
m=summary(data1[,17])
hist(data[,17],
    main = "histograma de Dados aleatórios", #Titulo
    xlab = "Valores",   # Rotulo do eixo X
    ylab = "Frequência",    # Rotulo do eixo Y
    col = "Skyblue",    # Cor das barras 
    border = "black",   # Cor da borda das Barras
    breaks = 30)    # Numero de bins
boxplot(data1[,17])