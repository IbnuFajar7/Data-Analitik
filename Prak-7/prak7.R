library(caret)
dataibnu=read.delim("clipboard")
head(dataibnu)
dataibnu$Fare = as.numeric(as.character(dataibnu$Fare))
str(dataibnu)
sampel1<-sample(1:nrow(dataibnu),0.75*nrow(dataibnu)) 
traininglogistik<-data.frame(dataibnu)[sampel1,] 
testinglogistik<-data.frame(dataibnu)[-sampel1,] 
modellogistik=glm(Survived~.,data=traininglogistik,family = binomial) 
summary(modellogistik)

prediksilogistik=predict(modellogistik,testinglogistik) 
pred_logreg<-as.numeric(prediksilogistik>.5) 
tabel_logreg<-table(pred_logreg,testinglogistik$Survived) 
tabel_logreg
confusionMatrix(table(pred_logreg,testinglogistik$Survived),positive = "1")
#### ek 2

library(dplyr)
iris.small <- filter(iris, Species %in% c("virginica", "versicolor"))
glm.out <- glm(Species ~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length,data = iris.small,family = binomial) # family = binomial required for logistic regression
summary(glm.out)
exp(coef(glm.out))
glm.out <- glm(Species ~ Sepal.Width + Petal.Width + Petal.Length,data = iris.small,family = binomial)
exp(coef(glm.out)) 
###### tugas
library(ggplot2)
lr_data <- data.frame(predictor=glm.out$linear.predictors, prob=glm.out$fitted.values, Species=iris.small$Species)
ggplot(lr_data, aes(x=predictor, y=prob, color=Species)) + geom_point()

ggplot(lr_data, aes(x=predictor, fill=Species)) + geom_density(alpha=.5)

plant1 <- data.frame(Sepal.Length=6.4, Sepal.Width=2.8, Petal.Length=4.6, Petal.Width=1.8)
plant2 <- data.frame(Sepal.Length=6.3, Sepal.Width=2.5, Petal.Length=4.1, Petal.Width=1.7)
plant3 <- data.frame(Sepal.Length=6.7, Sepal.Width=3.3, Petal.Length=5.2, Petal.Width=2.3)
predict(glm.out, plant1, type="response")
predict(glm.out, plant2, type="response")
predict(glm.out, plant3, type="response")    

cutoff <- 0
virg_true <- sum(lr_data$predictor > cutoff & lr_data$Species=="virginica") 
virg_false <- sum(lr_data$predictor <= cutoff & lr_data$Species=="virginica") 
virg_true
virg_false

vers_true <- sum(lr_data$predictor <= cutoff & lr_data$Species=="versicolor") 
vers_false <- sum(lr_data$predictor > cutoff & lr_data$Species=="versicolor") 
vers_true
vers_false

tp <- virg_true/(virg_true + virg_false)
tn <- vers_true/(vers_true + vers_false)
tp
tn

