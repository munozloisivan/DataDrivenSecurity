library(readr)

KnowledgeBaseDf <- read_csv("C:/Users/ivanm/Desktop/Master/5. Data Driven Security/DL_vulnerabilities_abtes2vm_20191217.csv", skip = 3)
view(KnowledgeBaseDf)

#Filtramos la KDB para quedarnos únicamente con aquellas columnas que nos pueden interesar
KDB_df <- KnowledgeBaseDf[,c("QID", "Category", "Modified", "Published", "CVE ID")]
View(KDB_df)
