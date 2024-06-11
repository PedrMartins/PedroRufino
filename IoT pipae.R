#Install the required package
###############################################################################
##############################ELEGÂNCIA EM BAIXAR PACOTES#######################

pkg <- c('googlesheets4',"lubridate", "timetk","dplyr","corrplot", "tidyr")
pkg <- pkg[!pkg%in%installed.packages()] 
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
pi_raw <- read_sheet("https://docs.google.com/spreadsheets/d/12JiclFJ9luvW9JPee77TJh1zCGnaPTcfv_RN6pl7hRk/edit?usp=sharing")	


########################################################
#####################Tratando dados##################

pi_d <- pi_raw 
pi_d <- pi_d |> 
  mutate(Yf=year(pi_d$Hora),
         Mf=month(pi_d$Hora),
         Df=day(pi_d$Hora),
         H=hour(pi_d$Hora),
         M=minute(pi_d$Hora),
         S=second(pi_d$Hora))

##por hora
pi_d <- pi_d [,-c(5,6,9:11)]


pi_d |> 
  head()
pi_d |> 
  srt()


############################################
#################Análises ####################


med_pd = pi_d |>
  summarize_by_time (.date_var=Data,
                     by="day", 
                     medco2=mean(CO2),
                     medtem=mean(Temperatura),
                     medpre=mean(Pressão)
  )
med_pd

l_p=lm (medco2~medpre, data= med_p)

med_ph= pi_d|> 
  group_by(H)|>
  summarise(medco2=mean(CO2),
            medtem=mean(Temperatura),
            medpre=mean(Pressão))
med_ph
############Estrutura gráfica########################

plot (medco2~medpre ,type="p", data= med_pd)
lines (medtem~medpre, data = med_pd) #plota linhas 
abline (l_p) #plot modelo linear
med_p <- med_p [-15,] #retirando NA
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
