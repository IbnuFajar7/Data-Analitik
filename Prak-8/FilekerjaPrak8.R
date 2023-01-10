dataku=read.csv("D:/File Kuliah Semester 5/Data Analitik/Prak-8/komoditas.csv")
View(dataku)

str(dataku)
dataku.pca=dataku[,2:6]
komoditas.pca <- prcomp(dataku.pca, center = TRUE, scale. = TRUE)
print(komoditas.pca)
plot(komoditas.pca, type = "l")

summary(komoditas.pca)
predict(komoditas.pca,  newdata=tail(dataku))
hasil=predict(komoditas.pca,  newdata=tail(dataku))
View(hasil)

install_github("vqv/ggbiplot")
komoditas.kota <- dataku[,1]
library(devtools)
library(ggbiplot)
g <- ggbiplot(komoditas.pca,ellipse = TRUE, circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', legend.position = 'top')
print(g)

g <- ggbiplot(komoditas.pca, obs.scale = 1,var.scale = 1,groups = komoditas.kota, circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', legend.position = 'top')
print(g)

##ek 2
install.packages("NbClust")
library(factoextra)
library(NbClust)
str(dataku)
ibnu.pca=dataku[,2:6]
View(ibnu.pca)
nb <- NbClust(ibnu.pca, distance = "euclidean",min.nc = 2, max.nc = 10, method = "complete", index = "all")
km.res=kmeans(ibnu.pca,3,nstart = 25)
fviz_cluster(km.res, data = ibnu.pca, geom = "point", stand = FALSE, frame.type = "norm")
fviz_cluster(km.res, data = ibnu.pca)

