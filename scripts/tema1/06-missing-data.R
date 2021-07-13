data = read.csv("../data/tema1/missing-data.csv", na.strings = "")

data_cleaned = na.omit(data)

is.na(data[4,2])
is.na(data[4,1])

is.na(data$Income)

#Limpiar NA de solamente la variable Income
data_income_cleaned = data[!is.na(data$Income),]

#Filas completas para un dataframe
complete.cases(data)

data_cleaned2 = data[complete.cases(data),]

#Medidas de centralización y dispersión 

mean(data$Income)
mean(data$Income, na.rm = T)

sd(data$Income)
sd(data$Income, na.rm = TRUE)