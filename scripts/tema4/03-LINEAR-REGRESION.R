library(caret)

auto <- read.csv("../data/tema4/auto-mpg.csv")
auto$cylinders <- factor(auto$cylinders,
                          levels = c(3,4,5,6,8),
                          labels = c("3c", "4c", "5c", "6c","8c"))


set.seed(2018)
t.id <- createDataPartition(auto$mpg, p=0.7, list=F)
names(auto)

mod<- lm(mpg ~ ., data = auto[t.id, -c (1,8,9)])

mod

#Ecuacion de Regresión Lineal

# mpg = 37.284202 + 6.231475 * 4c + 8.248195 * 5c + 2.131026 * 6c 
#       + 4.568171 * 8c + 0.002245 * displacement - 0.072209 * horsepower
#       - 0.004665 * weight + 0.050745 * acceleration  

summary(mod)

boxplot(mod$residuals)

pred <- predict(mod, auto[-t.id, -c(1,8,9)])

par(mfrow=c(2,2))
plot(mod)

# daptando la regresión lineal y poniendo como refencia al valor mas unoiforme

auto <- within(auto,
               cylinders <- relevel(cylinders, ref="4c"))
mod <- lm(mpg ~. , data = auto[-t.id, -c(1,8,9)])
mod
pred <- predict(mod, auto[-t.id, -c(1,8,9)])
plot(mod)

#SIMPLIFICAR EL MODELO LINEAL SEGUN EL AIC

library(MASS)

mod
summary(mod)

step.model <- stepAIC(mod, direction = "backward")
summary(step.model)
