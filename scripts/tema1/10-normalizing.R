housing = read.csv("../data/tema1/housing-with-missing-value.csv")

housing_z = scale(housing)

scale_many = function(dataframe, cols){
  names = names(dataframe)
  for (col in cols) {
    name = paste(names[col], "z", sep="_")
    dataframe[name] = scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado ", length(cols), " Variable(s)"))
  dataframe
}

housing = scale_many(housing, c(1, 3, 5:8))