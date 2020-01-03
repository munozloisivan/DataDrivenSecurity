library(readr)
library(ggplot2)

#Cargamos el archivo que contiene los datos del scan realizado
inputReportDf <- read_csv("C:/Users/ivanm/Desktop/Master/5. Data Driven Security/Scan_Results_abtes2vm_20191217_scan_1574870445_41138.csv",
skip = 6)
View(inputReportDf)

#Filtramos el Report que extraemos para quedarnos únicamente
#con aquellas columnas que nos interesan
mydf <- inputReportDf[,c("IP", "QID", "Type", "Severity", "CVE ID")]
View(mydf)

#Nos quedamos con los siguientes campos:
colnames(mydf)
#Podemos observar un ejemplo de estos datos:
head(mydf,5)

#Debemos asegurarnos que los datos que tenemos coinciden con la tipología que estos deberían tener
sapply(mydf, class)

#De la siguiente manera se puede construir un dataframe en el que tratar después
#cada tipo de dato como sea necesario por coerción
a1 <- inputReportDf[,c("IP")]
b2 <- inputReportDf[,c("QID")]
c3 <- inputReportDf[,c("Type")]
d4 <- inputReportDf[,c("Severity")]
e5 <- inputReportDf[,c("CVE ID")]

test <- data.frame(a1,b2,c3,d4,e5, stringsAsFactors = F)
View(test)


#Mostrar una gráfica en función del tipo de vulnerabilidad

#Creamos una tabla que clasifica por tipo, severidad y un contador
plotableType <- as.data.frame((table(test$Type, test$Severity)))
colnames(plotableType) <- c("Type", "Severity", "Count")
#Mostramos un gráfico que representa los valores de la tabla
ggplot(plotableType, aes(x=Type, y=Count)) + geom_bar(stat = "identity")

#Mostramos un gráfico que representa el total de vulns encontradas en función de su tipo y severidad
ggplot(plotableType, aes(x=Count, y=Severity)) + geom_point(aes(colour= factor(Type))) + scale_colour_manual(values = c("red", "blue", "green"))




