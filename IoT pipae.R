#Install the required package
###############################################################################
##############################ELEGÂNCIA EM BAIXAR PACOTES#######################

pkg <- c('googlesheets4',"lubridate", "timetk","dplyr","corrplot")
pkg <- pkg[!pkg%in%installed.packages()]
install.packages ("pkg")
#########################
library (googlesheets4)
library(lubridate)
library(timetk)
library(dplyr)
library(tidyr)
#library(corrplot)

#Read google sheets data into R
pi_raw <- read_sheet("https://docs.google.com/spreadsheets/d/12JiclFJ9luvW9JPee77TJh1zCGnaPTcfv_RN6pl7hRk/edit?usp=sharing")	


########################################################
#####################Tratando dados##################

pi_d <- pi_raw 
  head (pi_d)
pi_d$D_M_A <- lubridate::as_date (pi_d$Data)
pi_d <- pi_d [,-7]
pi_d<- separate(pi_d, 
    col = Hora,
    into = c("data_false", "h"), 
    sep = " "
  )
pi_d <- pi_d [,-7]

pi_d

#teste
hms (c("00:29:06", "00:29:17",
	 "00:29:17", "00:29:26", 
	"00:29:36", "00:29:46"), tz="UTC"	
	)

##############################################
#################Análises ####################


med_p = pi_d |>
  summarize_by_time (.date_var=D_M_A,
                     by="day", 
                     medco2=mean(CO2),
                     medtem=mean(Temperatura),
                     medpre=mean(Pressão)
                    )


l_p=lm (mco2_p$med~mco2_p$D_M_A)

ls()

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

############Estrutura gráfica########################

plot (medtem~D_M_A ,type="n", data= med_p)
lines (medtem~D_M_A, data = med_p) #plota linhas 
abline (l_p) #plot modelo linear
med_p <- med_p [-15,]
c_p=cor(as.data.frame(med_p[c(3:5)]))
corrplot (c_p)    


plot (CO2~Temperatura, type="n",data=pi_d)

points(CO2~Temperatura,
  col="gray4" ,pch =19,
  data=pi_d)


plot (medco2~medtem ,data=med_ph)

##################################################################


#Dividir os dados, pode ser importante colocar médias diárias (vai reduzir os dados)
#dividir em dia e noite pode ser uma boa idéia
#limpar outliers, mas devo ver os dados primeiro / preciso fazer uma análise exploratória
