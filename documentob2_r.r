rm(list=ls()) #limpa ambiente
x<-seq(-10,10,1) #Sequencia de -10 a 10, com tamanho de passo de 1
y<-x^2
plot(x,y,type='b')
############################################
x<-seq(0,2*pi,0.1) #crie uma sequencia de pontos de 0,2 PI com tamanho de passo de 0.1
y<-sin(x)
plot(x,y,type='1')
par(new=T)
plot(x,y,type='p')
plot(x,y,xlim=c(0,2*pi),ylim=c(-1,1))
############################################
rm(list=ls()) #limpa ambiente
library('plot3D')
seqi<-seq(-25,25,2)
seqj<-seq(-25,25,2)
M<-matrix(1,nrow=lenght(seqi),ncol=lenght(seqj))
ci<-0
for(i in seqi)
{
    ci<-ci+1
    cj<-0
    for(j in seqj)
    {
        cj<-cj+1
        M[ci,cj]<-i^3+j^3+6*i*j

    }
}
persp3D(seqi,seqj,M, contour=T)
library('rgl')
plot3d(seqi,seqj,M)
###########################################
data()
data(AirPassengers)
sumarry(AirPassengers)
plot(AirPassengers)
###########################################
rm(list=ls()) #limpa ambiente
data(iris)
summary(iris)
plot(iris)
image(as.matrix(dist(iris)))#distancia de todos os dados contra todos os dados-intra classes e entre classes
############################################
#conscontrução de dados sinteticos
rm(list=ls()) #limpa ambiente
xc1<-rnorm(30)*0.5+2
xc2<-rnorm(30)*0.5+4
plot(xc1,matrix(0,lenght(xc1)),col='red',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
par(new=T)
plot(xc2,matrix(0,lenght(xc2)),col='blue',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
x1<-c(xc1,xc2)
image(1:60,1:60,as.matrix(dist(x1)))
#########classificador
rm(list=ls()) #limpa ambiente
pdfvar<-function(x,u,s){(1/(sqrt(2*pi)*s))*exp(-(x-u)^2)/(2*s^2)}
classificax<-function(x,m1,s1,m2,s2){1.0*(pdfvar(x,m1,s1))>pdfvar(x,m2,s2)}

xc1<-rnorm(30)*0.5+2
xc2<-rnorm(30)*0.5+4

plot(xc1,matrix(0,length(xc1)),col='red',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
par(new=T)
plot(xc2,matrix(0,length(xc2)),col='blue',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
x1<-c(xc1,xc2)
#image(1:60,1:60,as.matrix(dist(x1)))

m1<-mean(xc1) #Média da amostra 1
d1<-sd(xc1) # Desvio padrão da amostra 1
m2<-mean(xc2)
d2<-sd(xc2)
xt<- seq(0,6,0.1)
yt1<-pdfvar(xt,m1,d1)
yt2<-pdfvar(xt,m2,d2)
par(new=T)
plot(xt,yt1,type='l',col='red',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
par(new=T)
plot(xt,yt2,type='l',col='blue',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
par(new=T)


classe<-classificax(xt,m1,d1,m2,d2)
plot(xc1,matrix(0,length(xc1)),col='red',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
par(new=T)
plot(xc2,matrix(0,length(xc2)),col='blue',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
plot(xt,classe,type='l',col='black',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')
par(new=T)
plot(xt, classe,type='l',col='black',xlim=c(0,6),ylim=c(0,1),xlab='',ylab='')

####################################### Classificador 2 - Matrizes (pdf duas varáveis)
#Gerar classificação em duas variaveis
#Gerar distribuição em duas variáveis
#Contorno em degrau
#Gerar em fráfico 3D

rm(list=ls()) #limpa ambiente
s1<-0.5
s2<-0.5
nc<-100
xc2<-matrix(rnorm(nc*2),ncol=2)*s2 +matrix(c(4,4),nrow=nc,ncol=2)
xc1<-matrix(rnorm(nc*2),ncol=2)*s1 +matrix(c(2,2),nrow=nc,ncol=2)
plot(xc1[,1],xc1[,2],type="p",col='red',xlim=c(0,6),ylim=c(0,6),xlab='',ylab='')
par(new=T)
plot(xc2[,1],xc2[,2],type="p",col='blue',xlim=c(0,6),ylim=c(0,6),xlab='',ylab='')
par(new=T)
pdf2var<-function(x1,x2,m1,s1,m2,s2,ro) (1/(2*pi*s1*s2*sqrt(1-ro)))*exp(-(1/(2*(1-ro^2)))*(((x1-m1)/s1^2-((2*ro*(x1-m1)*(x2-m2))/(s1*s2))+((x2-m2)/s2)^2))
xt[1:50]<-xc1[1:50,]
xt[51:100,]<-xc2[51:100,]
m11<-mean(xc1[,1])
m12<-mean(xc1[,2])
d11<-sd(xc1[,1])
d12<-sd(xc1[,2])
m21<-mean(xc2[,1])
m22<-mean(xc2[,2])
d21<-sd(xc2[,1])
d22<-sd(xc2[,2])

w1<-1
w2<-1

par(new=T)
#plot(xt[,1]),xt[,2],type='l',col='black',xlim=c(0,6),ylim=c(0,6),xlab='x1',ylab='x2')


library('plot3D')

seqi<-seq(0,10,0,1)
seqj<-seq(0,10,0,1)
M1<-matrix(1,nrow=length(seqi),ncol=length(seqj))
ci<-0
for(i in seqi)
{
    ci<-ci+1
    cj<-0
    for(j in seqj)
    {
        cj<-cj+1
        M1[ci,cj]<-1.0*((pdf2var(i,j,m11,d11,m12,md12,0)*w1)>(pdf2var(i,j,m21,d21,m22,d22,0)*w2))
    
    }
}
persp3D(seqi,seqj,M1, add=FALSE)

############################ Densidade de xc1 #######################
par(new=F)
m1<-mean(xc1[,1])
m2<-mean(xc1[,2])
d1<-sd(xc1[,1])
d2<-sd(xc1[,2])

seqi<-seq(0,10,0.1)
seqj<-seq(-,10,0.1)
M<-matrix(1,nrow=lenght(seqi),ncol=length(seqj))
ci<-0
for (i in seqi)
{
    ci<-ci+1
    cj<-0
    for(j in seqj)
    {
        cj<-cj+1
        M[ci,cj]<-pdf2var(i,j,m1,d1,m2,d2,0)
    }
}
par(new=T)
persp3D(seqi,seqj,M, add=TRUE)

####################################### Densidade de xc2 #######################
par(new=T)
m1<-mean(xc2[,1])
m2<-mean(xc2[,2])
d1<-sd(xc2[,1])
d2<-sd(xc2[,2])

seqi<-seq(0,10,0.1)
seqj<-seq(0,10,0.1)
M2<-matrix(1,nrow=length(seqi),ncol=length(seqj))
ci<-0
for (i in seqi)
{
    ci<-ci+1
    cj<-0
    for(j in seqj)
    {
        cj<-cj+1
        M2[ci,cj]<-pdf2var(i,j,m1,d1,m2,d2,0)
    }
}
persp3D(seqi,seqj,M2, add=TRUE)