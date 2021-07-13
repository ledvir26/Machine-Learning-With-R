students_data = read.fwf("../data/tema1/student-fwf.txt", 
                         widths=c(4, 15, 20, 15, 4), 
                         col.names=c("id", "nombre", "email", "carrera", "año"))