#Install the required package
install.packages('googlesheets4')
library (googlesheets4)
install.packages("lubridate")
install.packages("timetk")	
library(lubridate)
library(timetk)


#Read google sheets data into R
pi_d <- read_sheet("https://docs.google.com/spreadsheets/d/12JiclFJ9luvW9JPee77TJh1zCGnaPTcfv_RN6pl7hRk/edit?usp=sharing")	

pi_d  |>
head ()


pi_d$D_M_A <- lubridate::as_date (pi_d$Data)


#Acima foi abaixo tem que aprender
pi_d |>
summarize_by_time (.date_var=D_M_A,
			by="day", 
			med=mean())


# Libraries
library(dplyr)

# First value in each month
m4_daily %>%
    group_by(id) %>%
    summarise_by_time(
        .date_var = date,
        .by       = "month", # Setup for monthly aggregation
        # Summarization
        value  = first(value)
    )





#Dividir os dados, pode ser importante colocar médias diárias (vai reduzir os dados)
#dividir em dia e noite pode ser uma boa idéia
#limpar outliers, mas devo ver os dados primeiro / preciso fazer uma análise exploratória
#
