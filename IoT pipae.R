#Install the required package
###############################################################################
##############################ELEGÂNCIA EM BAIXAR PACOTES#######################

pkg <- c('googlesheets4',"lubridate", "timetk","dplyr","corrplot", "tidyr",'stringr')
pkg <- pkg[!pkg%in%installed.packages()] 
pkg
install.packages (pkg)
#########################
library (googlesheets4)
library(lubridate)
library(timetk)
library(dplyr)
library(tidyr)
library(corrplot)


########################################################
#Read google sheets data into R
pi_raw7 <- read_sheet("https://docs.google.com/spreadsheets/d/12JiclFJ9luvW9JPee77TJh1zCGnaPTcfv_RN6pl7hRk/edit?usp=sharing")	
pi_raw3 <- read_sheet("https://docs.google.com/spreadsheets/d/1phwbkcWpC61vraF0FrI5hI7Q9098EAz1LRYmzf5lUhg/edit?usp=sharing")

pi_raw7 <- read_sheet("https://docs.google.com/spreadsheets/d/12JiclFJ9luvW9JPee77TJh1zCGnaPTcfv_RN6pl7hRk/edit?usp=sharing")	
pi_raw7 <- read_sheet("https://docs.google.com/spreadsheets/d/12JiclFJ9luvW9JPee77TJh1zCGnaPTcfv_RN6pl7hRk/edit?usp=sharing")	
########################################################
#####################Tratando dados####################

pi_d <- pi_raw 
pi_d3 <- pi_raw3
pi_d3 <- pi_d3 [,-8]
pi_d <- pi_d |> 
  mutate(H=hour(pi_d$Hora))

##por hora
pi_d <- pi_d [,-c(5,6,8)]


pi_d3 |> 
  head()

10^4 
pi_d$`Luminosidade(?)`|>
  str () 

pi_d3 |> 
  tail()



pi_d |> 
 head()

colnames(pi_d3) <- c('co2','temp','U','P',"L",'uv','D') 
  range(pi_d3$co2)
  mean (pi_d3$co2)
  is.na(pi_d3$co2)
  
  range(pi_d3$temp)
  
  range(pi_d3$U)
  
  
  range(pi_d3$P)
  
  dim (pi_d3)
  

  
  
  10^4 
pi_d$`Luminosidade(?)`|>
  str () 

pi_d |> 
  tail()
#pi_d |> 
#  str()
pi_d |>
  dim()


############################################
#################Análises ####################


med_pd = pi_d |>
  summarize_by_time (.date_var=Data,
                     by="day", 
                     medco2=mean(CO2, na.rm = TRUE),
                     medtem=mean(Temperatura,na.rm = TRUE),
                     medpre=mean(Pressão,na.rm = TRUE)
  )
med_pd

l_p=lm (medtem~medco2, data= med_pd)

med_ph= pi_d|> 
  group_by(H)|>
  summarise(medco2=mean(CO2,na.rm = TRUE),
            medtem=mean(Temperatura,na.rm = TRUE),
            medpre=mean(Pressão,na.rm = TRUE))
med_ph [2] |>
  View()


############Estrutura gráfica########################

plot (medco2~Data ,type="n", data= med_pd)
lines (medco2~Data, data = med_pd) #plota linhas 
abline (l_p) #plot modelo linear
c_p=cor(as.data.frame(med_p[c(3:5)]))
corrplot (c_p)    

plot (medco2~H, data=med_ph, type="p")
lines (medco2~H, data=med_ph) #plota linhas 
lines(medtem~H, data=med_ph)
lines(medpre~H, data=med_ph)

plot (CO2~Temperaturamed_phplot (CO2~Temperatura, type="n",data=pi_d)

points(CO2~Temperatura,
       col="gray70" ,pch =19,
       data=pi_d)


plot (medco2~medtem ,data=med_ph)

#######################################################

x <- y <- ymd_hms("2012-03-26 10:10:00", tz = "America/Sao_Paulo")
tz(x)

tz(y) <- "America/Sao_Paulo"

x-y
#Dividir os dados, pode ser importante colocar médias diárias (vai reduzir os dados)
#dividir em dia e noite pode ser uma boa idéia
#limpar outliers, mas devo ver os dados primeiro / preciso fazer uma análise exploratória
