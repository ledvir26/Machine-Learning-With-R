clientes = c("Juan Gabriel", "Ricardo", "Pedro")
fechas = as.Date(c("2017-12-27", "2017-11-1", "2018-1-1"))
pago = c(315,192.55,40.15)
pedidos = data.frame(clientes,fechas, pago)

save(pedidos, file = "../data/tema1/pedidos.Rdata1")

data(iris)
save.image(file = "../data/tema1/alldata.Rdata")

data()