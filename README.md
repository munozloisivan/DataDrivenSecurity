# DataDrivenSecurity Project

### Autores
* Ivan Muñoz Lois
* Stela-Mihaela Chioveanu

MsC Cybersecurity Management - UPC

El *report de este proyecto es accesible* directamente desde: [RPubs](http://rpubs.com/munozloisivan/ProjectReportDDS)

## ¿En qué consiste el proyecto?

Este proyecto surge a raíz de la asignatura Data Driven Security que se imparte en el [máster Cybersecurity Management de la UPC](https://www.talent.upc.edu/esp/estudis/formacio/curs/221101/master-cybersecurity-management/)

El proyecto está enfocado en la parte de **Vulnerability Management** cogiendo como datos de entrada aquellos que podemos obtener directamente desde:

1. [Escaneo realizado mediante Qualys](https://qualysguard.qg2.apps.qualys.com/fo/scan/scanList.php)

2. [Knowledge Base de Qualys](https://qualysguard.qg2.apps.qualys.com/fo/tools/kbase.php)

--> Por una parte, cargamos los datos que obtenemos de un escaneo de vulnerabilidades realizado con Qualys, filtramos para quedarnos con aquellos campos más interesantes para nuestros posibles casos de estudio y los tratamos.

      Mostramos en este caso una clasificación en función de los              diferentes   tipos de vulnerabilidades identificadas (Ig, Practice       y Vuln) y su     severidad.
  
--> Por otra parte, cargamos la KnowledgeBase de Qualys y creamos un nuevo dataframe en el que relacionamos los datos obtenidos en el escaneo de vulnerabilidades y la información que nos aporta la KnowledgeBase a partir del campo 'QID' que tienen en común.

      De esta manera, podemos obtener una clasifiación por tipo de            vulnerabilidad identificada y CVSS.

## ¿Cómo puedo ejecutarlo?

### Requisitos / Instalación / Ejecucción

Será necesario descargar el código o hacer un fork del mismo.

Adicionalmente, se requerirá tener instalados los siguientes packages:

```
library(knitr)
library(rmdformats)
library(readr)
library(ggplot2)
library(dplyr)
```

### License

This project is licensed under the  - see the [LICENSE.md](https://github.com/munozloisivan/DataDrivenSecurity/blob/master/LICENSE) file for details


