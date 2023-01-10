library(olsrr)
library(car)
library(lmtest)
library(ggpubr)
data(mtcars)
View(mtcars)
#UJI ASUMSI TERHADAP ANALISIS REGRESI SEDERHANA
model <- lm(mpg ~ wt, data = mtcars) 
ols_plot_resid_qq(model)
ols_test_normality(model)

par(mfrow=c(2,2)) # Create a 2 x 2 plotting matrix
model <- lm(mpg ~ wt, data=mtcars) 
plot(model)

lmtest::bptest(model)

dwtest(model)

ols_plot_resid_hist(model) 
#UJI ASUMSI TERHADAP ANALISIS REGRESI BERGANDA
model = lm(mpg~ am + wt + hp, data=mtcars)
ols_plot_resid_qq(model)

ols_test_normality(model)
ols_plot_resid_hist(model)

lmtest::bptest(model)
dwtest(model)
ols_vif_tol(model)
##########################################

install.packages("FNN")
require(FNN)
library(FNN)
Advertising = read.csv("D:/File Kuliah Semester 5/Data Analitik/Prak-4/advertising.csv")
head(Advertising)

trainx=Advertising[,-4] #X-matrix
ad.knn <- knn.reg(trainx, test = NULL, Advertising$Sales, k = 3)
plot(Advertising$Sales,ad.knn$pred, xlab="y", ylab=expression(hat(y)))

var(ad.knn$pred)/var(Advertising$Sales) 

y=Advertising$Sales
yhat=ad.knn$pred
rsq=1-sum((y-yhat)^2)/sum((y-mean(y))^2);rsq

cor(yhat,y)^2 #approximate rsq very well. 

yhat2=predict(ad.lm,Advertising)
plot(Advertising$Sales,yhat2,xlab="y",ylab=expression(hat(y)))

rsq2=1-sum((y-yhat2)^2)/sum((y-mean(y))^2);rsq2

cor(yhat2,y)^2 #approximate rsq very w

dim(Advertising)

train <- sample(1:dim(Advertising)[1],.7*dim(Advertising)[1])
test=-train
train.Ad <- Advertising[train,]
test.Ad <- Advertising[test,]
lm.tr <- lm(Sales ~., data=train.Ad)
summary(lm.tr)

ols_plot_resid_qq(model)

lmtest::bptest(model)

dwtest(model)

ols_vif_tol(model)

