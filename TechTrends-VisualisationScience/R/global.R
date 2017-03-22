if(!require(devtools)) {install.packages("devtools", dependencies = TRUE);require(devtools)}
if(!require(lazyeval)) {devtools::install_github("hadley/lazyeval");require(lazyeval)}
if(!require(shiny)) {devtools::install_github("rstudio/shiny");require(shiny)}
if(!require(shinydashboard)) {install.packages("shinydashboard", dependencies = TRUE);require(shinydashboard)}
if(!require(shinyjs)) {install.packages("shinyjs", dependencies = TRUE);require(shinyjs)}
if(!require(shinyBS)) {devtools::install_github("ebailey78/shinyBS", ref = "shinyBS3");require(shinyBS)}
if(!require(shinythemes)) {install.packages("shinythemes", dependencies = TRUE);require(shinythemes)}
if(!require(plotly)) {install.packages("plotly");require(plotly)}
if(!require(plyr)) {install.packages("plyr", dependencies = TRUE);require(plyr)}
if(!require(dplyr)) {install.packages("dplyr");require(dplyr)}
if(!require(dtplyr)) {install.packages("dtplyr", dependencies = TRUE);require(dtplyr)}
if(!require(stringr)) {install.packages("stringr", dependencies = TRUE);require(stringr)}
if(!require(flexdashboard)) {install.packages("flexdashboard", dependencies = TRUE);require(flexdashboard)}
if(!require(networkD3)) {install.packages("networkD3", dependencies = TRUE);require(networkD3)}
if(!require(tidyr)) {install.packages("tidyr", dependencies = TRUE);require(tidyr)}
if(!require(fasttime)) {install.packages("fasttime", dependencies = TRUE);require(fasttime)}
if(!require(lubridate)) {install.packages("lubridate", dependencies = TRUE);require(lubridate)}
options(lubridate.fasttime = TRUE)
library(PlotBuildR)
