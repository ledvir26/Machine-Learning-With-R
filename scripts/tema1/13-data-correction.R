install.packages("tidyr")
library(tidyr)

crime.data = read.csv("../data/tema1/USArrests.csv", stringsAsFactors = FALSE)

View(crime.data)

crime.data = cbind(state = rownames(crime.data), crime.data)

crime.data.1 = gather(crime.data,
                      key = "crime-type",
                      value = "arrest_estimate",
                      Murder : UrbanPop)

crime.data.2 = gather(crime.data,
                      key = "crime_type",
                      value = "arrest_estimate",
                      -state)

crime.data.3 = gather(crime.data,
                      key = "crime_type",
                      value = "arrest_estimate",
                      Murder, Assault)