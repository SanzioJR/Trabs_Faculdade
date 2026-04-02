#-----------------------------------------
rm(list=ls())
#-----------------------------------------
yperceptron<-function(xvec,w,par)
 # Returns the resposnse yo fasingle e Perceptron neuron
 # Xvec: Input matrix with N rows and m colunms containing the
 # data set or a single inputvector x , wich may contain
 # or not the additional fixed ???1 element corresponding
 # to the bias
 # w: weight vector
 # par: if par=1 then x must be augmented by a ????1 column
{
    if (par==1) # Checks par as above
        xvec<-cbind(-1,xvec) # Augments -1 if needed
    u<-xvec %*% w
    y<-1.0*((u>=0))
    return ((as.matrix(y)))
}


trainperceptron<-function(xin,yd,eta,tol,maxepocas,par)
 # Trains a simple Perceptron
 # xin: input  Nxn Dataset matrix
 # eta: weight update step
 # tol: error global
 # maxepocas: maximum number of epochs allowed
 # par: par = 1 indicates that ????1 needs to be
 # agumented to xin
{
    dimxin<-dim(xin)
    n<-dimxin[1]
    n<-dimxin[2]
    if(par==1){
    wt<-as.matrix(runif(n+1)-0.5)
    xin<-cbind(-1,xin)
    }else wt<-as.matrix(runif(n)-0.5)
    nepocas<-0
    eepoca<-tol+1 

    # vetor de erro
    evec<-matrix(nrow=1,ncol=maxepocas)
    while((nepocas < maxepocas) && (eepoca > tol))
    {
        ei2<-0
        xseq<-sample(n)
        for(i in 1:n)
        {
            irand<-xseq[i]
            yhati<-1.0*((xin[irand,] %*% wt)>=0)
            ei<-yd[irand-yhati]
            dw<-eta*wi*xin[irand,]
            wt<-wt+dw
            ei2<-ei2+ei*ei
        }
        nepocas<-nepocas+1
        evec[nepocas]<-ei2/N
        eepoca<-evec[nepocas]
    }
    retlist<-list(wt,evec[1:nepocas])
    return (retlist)
}

#----------------Exemplo-------------------------
#Usar base de dados Iris (focar em transformar 3 tipos em 2 tipos)
data(iris)
ntrain<-10
#dividir a base iris ( no caso, para treinar, x são as variáveis - os rotulos se tornam y e precisam ser tratados)
xc1<-iris[1:50,1:4] #coletar amostras 1 a 50, limitando-se a 4 variáveis
xc2<-iris[76:125,1:4] #coletar amostras 76 a 125, limitando-se a 4 variáveis
#numero máximo de testes
maxteste<-20
#erros que serão acumulados
erros<-matrix(0,nrow=maxteste,ncol=100)

#y transformando "setosa" em 0 e "versicolor" e "virginica"
ytt<-matrix(0,nrow=100-(ntrain*2),ncol=maxteste)
#Iniciando os pesos em wt
wtt<-matrix(0,nrow=5,ncol=maxteste)

for(t in 1:maxteste){
    #Gerando uma primeira lista aleatória de indices de 1 a 50
    seq1<-sample(50)
    #Embaralhando a entrada x de treinamento com a sequencia aleatória que foi gerada
    xct1treina<-xc1[seqc1[1:ntrain],]
    #embaralhando as respostas y de treinamento com a sequencia aleatória que foi gerada - sincronizada com x
    yct1treina<-matrix(0,nrow=ntrain)

    seqc2<-sample(50)
    xc2treina<-xc2[seqc2[1:ntrain],]
    yct2treina<-matrix(1,nrow=ntrain)

    #Base com caso igual a 0
    xc1teste<-xc1[seqc1[(ntrain+1):50],]
    yct1teste<-matrix(0,nrow=(50-ntrain))
    #Base com caso igual a 1
    xc2teste<-xc2[seqc2[(ntrain+1):50],]
    yct2teste<-matrix(1,nrow=(50-ntrain))

    xin<-as.matrix(rbind(xc1treina,xc2treina))
    yd<-rbind(yc1treina,yc2treina)

    xinteste<-as.matrix(rbind(xc1teste,xc2teste))
    yteste<-rbind(yc1teste,yc2teste)

    retlist<-trainperceptron(xin,yd,0.1,0.01,100,1)

    wt<-as.matrix(unlist(retlist[1]))
    wtt[1:length(wt),t]<-wt[1:length(wt)]

    yt<-yperceptron(xinteste,wt,1)
    ytt[1:length(yt),t]<-yt[1:length(yt)]

    erroteste<-as.matrix(unlist(retlist[2]))
#plot(erroteste,type='l')
#plot(wt,type="l")
    a<-1
    for(a in 1:length(erroteste)){
    erros[t,a]<-erroteste[a]
    }
}
#Erros M?dios considerando o n?mero m?ximo de ?pocas
errosmedios<-matrix(0,nrow=100)

for (b in 1:100){
  errosmedios[b]<-mean(erros[1:maxteste,b])
}

plot(errosmedios,type="l",xlab="número total de épocas",ylab="média de erros",main="Média de Erros x épocas")

boxplot(erros[1:100],main="Boxplot Erros",xlab="épocas",ylab="Erros")
#Média das respostas de classificação
yttmedios<-matrix(0,nrow=100-(2*ntrain))
for (b in 1:(100-(2*ntrain))){
  yttmedios[b]<-mean(ytt[b,1:maxteste])
}
#Mostrando a classificação em comparação com as amostras
plot(yttmedios, type='l',xlab="Amostras de Análise",ylab="", main=cbind('Classificação: ',maxteste,' Experimentos'))
par(new=T)
plot(yteste, type='p',xlab="Amostras de Análise",ylab="", main=cbind('Classificação: ',maxteste,' Experimentos'))

#Variância Erros Médios considerando o número máximo de épocas
errosvar<-matrix(0,nrow=100)
for (b in 1:100){
  errosvar[b]<-var(erros[1:maxteste,b])
}

plot(errosvar[1:5],type='l',xlab="número total de épocas",ylab="variância de erros",main="Variância de Erros x épocas")

#Média Pesos considerando o número máximo de épocas
wttmedios<-matrix(0,nrow=5)

for (c in 1:5){
  wttmedios[c]<-mean(wtt[c,1:maxteste])
}
plot(wttmedios, type='b',xlab="w",ylab="valor médio", main=cbind('Classificação: ',maxteste,' Experimentos - valores Médios de w'))
#Variância Pesos considerando o número máximo de épocas
wttvar<-matrix(0,nrow=5)

for (c in 1:5){wttvar[c]<-var(wtt[c,1:maxteste])}
plot(wttvar, type='b',xlab="w",ylab="variância", main=cbind('Classificação: ',maxteste,' Experimentos - variância de w'))