housing.data = read.csv("../data/tema1/housing-with-missing-value.csv",
                        header = T, stringsAsFactors = F)

summary(housing.data)

## Eliminar todas las observaciones que contengan algún NA
housing.data.1 = na.omit(housing.data)
summary(housing.data.1)

##Eliminar las NAs de ciertas columnas 
drop_na = c("rad")
housing.data.2 = housing.data[complete.cases(housing.data[,!(names(housing.data)) %in% drop_na]),]

## Eliminar toda una columna del dataframe
housing.data$rad = NULL


install.packages("Hmisc")
library(Hmisc)
housing.data = read.csv("../data/tema1/housing-with-missing-value.csv",
                        header = T, stringsAsFactors = F)

housing.data.copy1 = housing.data
View((housing.data.copy1))

housing.data.copy1$ptratio = impute(housing.data.copy1$ptratio, mean)
housing.data.copy1$rad = impute(housing.data.copy1$rad, mean)
summary(housing.data.copy1)


install.packages("mice")
library(mice)

md.pattern(housing.data)

install.packages("VIM")
library(VIM)

aggr(housing.data, 
     col= c('green', 'red'),
     numbers = TRUE,
     sortVars = TRUE,
     labels = names(housing.data),
     cex.axis = 0.75,
     gap = 1,
     ylab = c("Histograma de NAs", "Patrón"))