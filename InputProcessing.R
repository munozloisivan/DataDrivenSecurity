library(readr)
inputReportDf <- read_csv("C:/Users/ivanm/Desktop/Master/5. Data Driven Security/Scan_Results_abtes2vm_20191217_scan_1574870445_41138.csv",
skip = 6)
View(inputReportDf)

#Filtramos el Report que extraemos para quedarnos únicamente
#con aquellas columnas que nos interesan
mydf <- inputReportDf[,c("IP", "QID", "Type", "Severity", "CVE ID")]
View(mydf)

#IPdf <- df[,c("IP","QID")]
#View(IPdf)
