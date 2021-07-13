library(jsonlite)

dat.1 = fromJSON("../data/tema1/students.json")

dat.2 = fromJSON("../data/tema1/student-courses.json")
library(curl)
url = "http://www.floatrates.com/daily/usd.json"
currencies = fromJSON(url)

currency_data = currencies$list$resources$resource$fields
currency_data