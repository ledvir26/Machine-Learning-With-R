auto <- read.csv("../data/tema2/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders, levels=c(3,4,5,6,8),
                         labels = c("3cil", "4cil", "5cil", "6cil","8cil"))

attach(auto)

head(cylinders)
