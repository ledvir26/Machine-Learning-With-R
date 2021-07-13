install.packages("scales")
library(scales)

students = read.csv("../data/tema1/data-conversion.csv")

students$Income_rescaled = rescale(students$Income)



rescale.many <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "rescaled", sep = ".")
    dataframe[name] <- rescale(dataframe[,col]) 
  }
  cat(paste("Hemos reescalado ", length(cols), " variable(s)"))
  dataframe
}

students = rescale.many(students, c(1,4))
