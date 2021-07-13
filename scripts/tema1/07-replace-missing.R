data = read.csv("../data/tema1/missing-data.csv", na.strings = "")
data$Income_mean = ifelse(is.na(data$Income),
                          mean(data$Income, na.rm = T),
                          data$Income)

x = data 
# x es un vector de datos que puede contener NA
rand_impute <- function(x) {
  # missing contiene un vector de valores T/F dependiendo del NA de x
  missing = is.na(x)
  # n_missing contiene cuantos valores son NA dentro de x
  n_missing = sum(missing)
  # x_obs son los valores conocidos que tienen dato diferente de NA en x 
  x_obs = x[!missing]
  #por efecto, devolvera el mismo que habia entrado por parámetro 
  imputed = x
  # enlos valores que faltaban, los reemplazamos por la muestra
  # de los que si conocemos (MAS)
  imputed[missing] = sample(x_obs, n_missing, replace=TRUE)
  return (imputed)
}

random_impute_data_frame <- function(dataframe, cols) {
  names = names(dataframe)
  for (col in cols) {
    name = paste(names[col], "imputed", sep = ".")
    dataframe[name] = rand_impute(dataframe[,col])
  }
  dataframe
}

data = read.csv("../data/tema1/missing-data.csv", na.strings = "")
data$Income[data$Income==0] = NA
data = random_impute_data_frame(data, c(1,2))



