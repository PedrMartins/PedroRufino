#########################
library (googlesheets4)
library(lubridate)
library(timetk)
library(dplyr)
library(tidyr)
library(corrplot)
library(stringr)



########################################################
#Read google sheets data into R
pi_raw7 <- read_sheet("https://docs.google.com/spreadsheets/d/12JiclFJ9luvW9JPee77TJh1zCGnaPTcfv_RN6pl7hRk/edit?usp=sharing")	

pi_raw3 <- read_sheet("https://docs.google.com/spreadsheets/d/1phwbkcWpC61vraF0FrI5hI7Q9098EAz1LRYmzf5lUhg/edit?usp=sharing")

pi_raw1 <- read_sheet("https://docs.google.com/spreadsheets/d/1jLoYcTOOFJzFsIb_G3mQ9Lc6F1ieDMyPDWmoRgMWVAk/edit?usp=sharing")	

pi_raw2 <- read_sheet("https://docs.google.com/spreadsheets/d/1mNu5C6HsNsjjveFR2k5aHRkv92n4m1LRutTdy3lm6TA/edit?usp=sharing")	



########################################################
########################################################
########################Teste Pipae#####################
########################pipae 3#########################

pi_d3 <- pi_raw3
pi_d3 <- pi_d3 [,-8]


pi_d3 |>
  dim ()

pi_d3 |> 
  head()

pi_d7 |> 
  tail()

pi_d3|>
  str ()

colnames(pi_d3) <- c('co2','temp','U','P',"L",'uv','D') 

co=range(pi_d3$co2,na.rm = TRUE)
Tem=range(pi_d3$temp,na.rm = TRUE)
Um=range(pi_d3$U,na.rm = TRUE)
Pre=range(pi_d3$P,na.rm = TRUE)
Di=range(pi_d3$D,na.rm = TRUE)
c
Test_p3 =tibble(
  var1=c('co2','temp','U','P'),
  rMin=c(co[1],Tem[1],Um[1],Pre[1]),
  rMax=c(co[2],Tem[2],Um[2],Pre[2]),
  Med=c(mean (pi_d3$co2,na.rm = TRUE), mean (pi_d3$temp,na.rm = TRUE),
        mean (pi_d3$U,na.rm = TRUE),mean (pi_d3$P,na.rm = TRUE))
)
Test_p3






########################pipae 1#########################



pi_d1 <- pi_raw1
pi_d1 <- pi_d1 [,-8]


pi_d1 |>
  dim ()

pi_d1 |> 
  head()

pi_d1 |> 
  tail()

pi_d1|>
  str ()

which (is.na(pi_d1$co2))

colnames(pi_d1) <- c('co2','temp','U','P',"L",'uv','D') 

co=range(pi_d1$co2,na.rm = TRUE)
Tem=range(pi_d1$temp,na.rm = TRUE)
Um=range(pi_d1$U,na.rm = TRUE)
Pre=range(pi_d1$P,na.rm = TRUE)
Di=range(pi_d1$D,na.rm = TRUE)


Test_p1 =tibble(
  var1=c('co2','temp','U','P'),
  rMin=c(co[1],Tem[1],Um[1],Pre[1]),
  rMax=c(co[2],Tem[2],Um[2],Pre[2]),
  Med=c(mean (pi_d1$co2, na.rm = TRUE), mean (pi_d1$temp,na.rm = TRUE),
        mean (pi_d1$U,na.rm = TRUE),mean (pi_d1$P,na.rm = TRUE)))

Test_p1

 










########################pipae 2#########################



pi_d2 <- pi_raw2
pi_d2 <- pi_d1 [,-8]


pi_d2 |>
  dim ()

pi_d2 |> 
  head()

pi_d2 |> 
  tail()

pi_d2|>
  str ()


#########tabela teste
#which (is.na(pi_d1$co2))
###
#colnames(pi_d1) <- c('co2','temp','U','P',"L",'uv','D') 

#co=range(pi_d1$co2,na.rm = TRUE)
#Tem=range(pi_d1$temp,na.rm = TRUE)
#Um=range(pi_d1$U,na.rm = TRUE)
#Pre=range(pi_d1$P,na.rm = TRUE)
#Di=range(pi_d1$D,na.rm = TRUE)


#Test_p1 =tibble(
#  var1=c('co2','temp','U','P'),
#  rMin=c(co[1],Tem[1],Um[1],Pre[1]),
#  rMax=c(co[2],Tem[2],Um[2],Pre[2]),
#  Med=c(mean (pi_d1$co2, na.rm = TRUE), mean (pi_d1$temp,na.rm = TRUE),
#        mean (pi_d1$U,na.rm = TRUE),mean (pi_d1$P,na.rm = TRUE)))

#Test_p1
########


