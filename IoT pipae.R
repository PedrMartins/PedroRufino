#Install the required package
###############################################################################
##############################ELEGÂNCIA EM BAIXAR PACOTES#######################

pkg <- c('googlesheets4',"lubridate", "timetk","dplyr")
pkg <- pkg[!pkg%in%installed.packages()]
install.packages ("pkg")
#########################
install.packages("dplyr")
install.packages("corrplot")
install.packages("timetk")
library (googlesheets4)
library(lubridate)
library(timetk)
library(dplyr)
library(corrplot)

#Read google sheets data into R
pi_d <- read_sheet("https://docs.google.com/spreadsheets/d/12JiclFJ9luvW9JPee77TJh1zCGnaPTcfv_RN6pl7hRk/edit?usp=sharing")	

pi_d  
  head (pi_d)
pi_d$D_M_A <- lubridate::as_date (pi_d$Data)
names (pi_d)
plot (CO2~Temperatura, type="n",data=pi_d)

points(CO2~Temperatura,
  col="gray4" ,pch =19,
  data=pi_d)

##############################################
#Média ṕor dia
med_p = pi_d |>
  summarize_by_time (.date_var=D_M_A,
                     by="day", 
                     medco2=mean(CO2),
                     medtem=mean(Temperatura),
                     medpre=mean(Pressão)
                    )

l_p=lm (mco2_p$med~mco2_p$D_M_A)


###Estrutura gráfica

plot (medtem~D_M_A ,type="n", data= med_p)
lines (medtem~D_M_A, data = med_p) #plota linhas 
abline (l_p) #plot modelo linear
med_p <- med_p [-15,]
c_p=cor(as.data.frame(med_p[c(3:5)]))
corrplot (c_p)    

##############################################

##############################################
##############################################

#arrumar hora
#trabalhoso
pi_d$H <- lubridate::as_date (pi_d$Hora, tz=NULL)
pi_d$H <- ymd_h(pi_d$H)
pi_d$H <- round_date(pi_d$Hora, unit ="minute")

plot (CO2~H, data = pi_d)
#tem que fazer a média por hora <--


med_ph = pi_d |>
  summarize_by_time (.date_var=Hora,
                     by="hours", 
                     medco2=mean(CO2),
                     medtem=mean(Temperatura),
                     medpre=mean(Pressão)
  )
med_ph

plot (medco2~medtem ,data=med_ph)


ls()
#Dividir os dados, pode ser importante colocar médias diárias (vai reduzir os dados)
#dividir em dia e noite pode ser uma boa idéia
#limpar outliers, mas devo ver os dados primeiro / preciso fazer uma análise exploratória

