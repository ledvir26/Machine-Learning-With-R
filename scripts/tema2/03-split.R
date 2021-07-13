#split /unsplit

data <- read.csv("../data/tema2/auto-mpg.csv", stringsAsFactors = FALSE)

carslist <- split(data, data$cylinders)