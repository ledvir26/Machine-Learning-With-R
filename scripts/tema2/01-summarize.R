data = read.csv("../data/tema2/auto-mpg.csv", header = T, stringsAsFactors = FALSE)

data$cylinders <- factor(data$cylinders, levels = c(3,4,5,6,8),
                         labels = c("3cil","4cil","5cil","6cil","8cil"))

summary(data)
str(data)


summary(data$cylinders)



install.packages(c("modeest", "raster", "moments"))
install.packages("BiocManager")
BiocManager::install("genefilter")
BiocManager::install("digest")

library(modeest) #moda
library(raster) # quantiles, cv
library(moments) # asimetria, curtosis

X = data$mpg

### MEDIDAS DE CENTRALZIACIÓN

mean(X) 
median(X)
modal(X)  # raster packages
quantile(X)

### MEDIDAS DE DISPERSION

var(X)  # Varianza
sd(X)  # desviación estandar
cv(X)  # coeficiente de varicaión

### MEDIDAS DE ASIMETRIA

skewness(X)
kurtosis(X)


hist(X)