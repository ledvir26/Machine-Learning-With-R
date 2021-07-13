auto = read.csv("../data/tema1/auto-mpg.csv", header=TRUE, sep = ",")
names(auto)
library(XML)

url = "../data/tema1/cd_catalog.xml"

xmldoc = xmlParse(url)
rootnode = xmlRoot(xmldoc)
rootnode[2]

cds_data = xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))
cds_data = data.frame(t(cds_data), row.names = NULL)
head(cds_data,2)