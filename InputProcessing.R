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
#Se harían las transformaciones correspondientes

#Una vez hechas, construimos de nuevo el dataframe con el que trabajaremos
test <- data.frame(a1,b2,c3,d4,e5, stringsAsFactors = F)
#Comprobamos que esté correcto
View(test)

#Creamos una tabla que clasifica por tipo, severidad y un contador
plotTable <- as.data.frame((table(test$Type, test$Severity)))
#Asignamos nombres a cada columna de la tabla
colnames(plotTable) <- c("Type", "Severity", "Count")

head(plotTable,3)

#Mostramos un gráfico que representa los valores de la tabla
plot1 <- ggplot(plotTable, aes(x=Type, y=Count)) + geom_bar(stat = "identity") + scale_fill_manual(values = c("red", "blue", "green"))
plot(plot1)

#Mostramos un gráfico que representa el total de vulns encontradas en función de su tipo y severidad
ggplot(plotTable, aes(x=Count, y=Severity)) + geom_point(aes(colour= Type)) + scale_colour_manual(values = c("red", "blue", "green"))


#
#
# ---> Prueba de Concepto <---

# Leer la KDB, filtrar el dataframe y posteriomente poder relacionar ambos dataframes para poder obtener información del CVSS
KnowledgeBaseDfPOC <- read_csv("C:/Users/ivanm/Desktop/Master/5. Data Driven Security/DL_vulnerabilities_abtes2vm_20191217.csv", skip = 3)
KDB_dfPOC <- KnowledgeBaseDfPOC[,c("QID", "Category", "Modified", "Published", "CVSS Base", "CVE ID")]
View(KDB_dfPOC)

#Eliminar aquellos que no tengan valor CVSS
KDB_dfPOC_clean <- filter(KDB_dfPOC, KDB_dfPOC$`CVSS Base` != '\'-')
View(KDB_dfPOC_clean)

#Juntamos los 2 DataFrame para poder relacionar datos
dfPOC <- merge(test, KDB_dfPOC_clean, by ="QID")

#Filtramos de nuevo os datos, dado que tenemos algunos como la columna CVE.ID dado que es igual en ambos dataframes
dfPOC <- dfPOC[,c("QID", "IP", "Type", "Severity", "CVSS Base", "CVE ID")]
View(dfPOC)

#Qualys classifies vulnerabilities according to QID, simply a unique identifier given to that exact issue



#
#

# ********************************************************************************************************

#
#
#
# ---> Inicio Prueba de código en funciones a ser llamadas desde Report.Rmd <---

# cpe.file <- "C:/Users/ivanm/Desktop/Master/5. Data Driven Security/Scan_Results_abtes2vm_20191217_scan_1574870445_41138.csv"

# CleanCPEs <- function(cpes) {
# 
#   #data manipulation
# 
#   mydf <- cpes[,c("IP", "QID", "Type", "Severity", "CVE ID")]
# 
#   #Nos quedamos con los siguientes campos:
#   colnames(mydf)
#   #Podemos observar un ejemplo de estos datos:
#   head(mydf,5)
# 
#   #Debemos asegurarnos que los datos que tenemos coinciden con la tipología que estos deberían tener
#   sapply(mydf, class)
# 
#   #De la siguiente manera se puede construir un dataframe en el que tratar después
#   #cada tipo de dato como sea necesario por coerción
#   a1 <- cpes[,c("IP")]
#   b2 <- cpes[,c("QID")]
#   c3 <- cpes[,c("Type")]
#   d4 <- cpes[,c("Severity")]
#   e5 <- cpes[,c("CVE ID")]
#   #Se harían las transformaciones correspondientes
# 
#   #Una vez hechas, construimos de nuevo el dataframe con el que trabajaremos
#   test <- data.frame(a1,b2,c3,d4,e5, stringsAsFactors = F)
#   #Comprobamos que esté correcto
# 
#   return(test)
# }
# 
# ParseCPEData <- function(cpe.file) {
# 
#   # load cpes as csv file
#   cpes <- read_csv(cpe.file, skip = 6)
# 
#     # transform, clean, arrange parsed cpes as data frame
#   #df <- CleanCPEs(cpes)
# 
#   # return data frame
#   return(cpes)
# }

#
#
# ---> Fin prueba de código en funciones a ser llamadas desde Report.Rmd <---





