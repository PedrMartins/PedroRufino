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
pi_d7 <- pi_raw7
pi_d7 <- pi_d7 [,-c(5:8)]
colnames(pi_d7) <- c("co2","tem","U","P")
################## atenção

range(pi_d7$co2, na.rm = TRUE)
 a=pi_d7 [pi_d7$co2 >= 1000 ,] |>
   View()


pi_raw3 <- read_sheet("https://docs.google.com/spreadsheets/d/1phwbkcWpC61vraF0FrI5hI7Q9098EAz1LRYmzf5lUhg/edit?usp=sharing")
pi_d3 <- pi_raw3
colnames(pi_d7) <- c("co2","tem","U","P")

############### atenção
pi_d3 <- pi_d3 [,-8]
e = pi_d3[1] [pi_d3$co2 >= 1000 ,] |>
  View()



pi_raw1 <- read_sheet("https://docs.google.com/spreadsheets/d/1jLoYcTOOFJzFsIb_G3mQ9Lc6F1ieDMyPDWmoRgMWVAk/edit?usp=sharing")	
pi_d1 <- pi_raw1


############### atenção
pi_d1 <- pi_d1 [,-8]
b= pi_d1[1] [pi_d1$co2 >= 1000 ,] |>
View()

pi_raw2 <- read_sheet("https://docs.google.com/spreadsheets/d/1mNu5C6HsNsjjveFR2k5aHRkv92n4m1LRutTdy3lm6TA/edit?usp=sharing")	
pi_d2 <- pi_raw2
pi_d2 <- pi_d1 [,-8]


########################################################
########################################################
########################Teste Pipae#####################
########################pipae 3#########################
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
pi_d2 |>
  dim ()

pi_d2 |> 
  head()

pi_d2 |> 
  tail()

pi_d2|>
  str ()


#########tabela teste
#which (is.na(pi_d2$co2))
###
#colnames(pi_d2) <- c('co2','temp','U','P',"L",'uv','D') 

#co=range(pi_d2$co2,na.rm = TRUE)
#Tem=range(pi_d2$temp,na.rm = TRUE)
#Um=range(pi_d2$U,na.rm = TRUE)
#Pre=range(pi_d2$P,na.rm = TRUE)
#Di=range(pi_d2$D,na.rm = TRUE)


#Test_p1 =tibble(
#  var1=c('co2','temp','U','P'),
#  rMin=c(co[1],Tem[1],Um[1],Pre[1]),
#  rMax=c(co[2],Tem[2],Um[2],Pre[2]),
#  Med=c(mean (pi_d1$co2, na.rm = TRUE), mean (pi_d1$temp,na.rm = TRUE),
#        mean (pi_d1$U,na.rm = TRUE),mean (pi_d1$P,na.rm = TRUE)))

#Test_p1
########
pi_d1 = head (pi_d7)


pi_d2 = head (pi_d7, 30)

pi_d3 = tail(pi_d7, 50)


pipae= list(pi_d1,pi_d2,pi_d3)


for ( i in  pipae ) 
  {
  a= c(
    mean (i[[1]])
    )
  }
  
  a
  { 
  Co=range(i$co2,na.rm = TRUE)
  Tem=range(i$temp,na.rm = TRUE)
  Um=range(i$U,na.rm = TRUE)
  Pre=range(i$P,na.rm = TRUE)
  Di=range(i$D,na.rm = TRUE)
  
  d=tibble(
    var1=c('co2','temp','U','P'),
    rMin=c(Co[1],Tem[1],Um[1],Pre[1]),
    rMax=c(Co[2],Tem[2],Um[2],Pre[2]),
    Med=c(mean (i$co2,na.rm = TRUE), mean (i$temp,na.rm = TRUE),
          mean (i$U,na.rm = TRUE),mean (i$P,na.rm = TRUE))
  )
  
  tabalatest=list (d)
}

tabalatest
my_list <- list(c(5, 8, 2, 9), 'cat', 'dog', c('koala', 'panda', 'rabbit'), TRUE, 3.14)
