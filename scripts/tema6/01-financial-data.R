AAPL <- read.csv("../data/tema6/AAPL.csv", stringsAsFactors = F)
AMZN <- read.csv("../data/tema6/AMZN.csv", stringsAsFactors = F)
FB <- read.csv("../data/tema6/FB.csv", stringsAsFactors = F)
GOOG <- read.csv("../data/tema6/GOOG.csv", stringsAsFactors = F)

AMZN <- AMZN[AMZN$Date >= '2008-01-01',]
AAPL <- AAPL[AAPL$Date >= '2008-01-01',]
GOOG <- GOOG[GOOG$Date >= '2008-01-01',]

str(AAPL)
# hACEMOS CATING A LAS FECHAS DE LAS MISMAS..

AAPL$Date <- as.Date(AAPL$Date)
AMZN$Date <- as.Date(AMZN$Date)
FB$Date <- as.Date(FB$Date)
GOOG$Date <- as.Date(GOOG$Date)


library(ggplot2)

ggplot(AAPL, aes(Date, Close)) +
  geom_line(aes(color="Apple")) +
  geom_line(data=AMZN, aes(color = "Amazon"))+
  geom_line(data=FB, aes(color="Facebook"))+
  geom_line(data=GOOG, aes(color="Google"))+
  labs(color="Legend")+
  scale_color_manual("", 
                     breaks = c("Apple", "Amazon", "Facebook", "Google" ),
                     values = c("gray", "yellow", "blue", "red"))+
  ggtitle("Comparaciones de cierre de stocks")+
  theme(plot.title = element_text(lineheight = 0.7, face = "bold"))


##Cargar datos en tiempo real
install.packages("quantmod")
library(quantmod)

getSymbols("AAPL")
barChart(AAPL)
