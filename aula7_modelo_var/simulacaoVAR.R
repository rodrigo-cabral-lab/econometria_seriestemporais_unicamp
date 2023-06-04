# Modelo de Simulação - VAR(1)

install.packages('tsDyn')
library(tsDyn)

#Simulação de VAR sem intercepto 
B1<-matrix(c(0.4, 0.4, 0.1, 0.6), 2)
set.seed(123)

var1<-VAR.sim(B=B1,n=2000,include="none")
ts.plot(var1, type="l", col=c(1,2))



#Simulação de VAR com intercepto
B3<-rbind(c(0.5, 0.7, 0.3), c(0, 0.3, 0.7))
set.seed(7)
var3<-VAR.sim(B=B3,n=100, include="const")
ts.plot(var3, type="l", col=c(1,2))

B4<-rbind(c(0.5, 0.7, -0.3), c(0, -0.3, 0.7))
set.seed(2)
var4<-VAR.sim(B=B4,n=100, include="const")
ts.plot(var4, type="l", col=c(1,2))

# Simulando modelos VAR
# Pacote para estimar o VAR
install.packages('vars')
library(vars)

#Vamos considerar as séries geradas pelo modelo var1
colnames(var1)=c("x","y")

var1_est<-VAR(var1,lag.max = 10,ic="SC",type="none")

var1_est$p

var1_est$varresult

B1

var1_est<-VAR(var1,lag.max = 10,ic="AIC",type="none")
var1_est$p
var1_est$varresult


