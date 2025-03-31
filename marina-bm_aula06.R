library(WDI) # CARREGAR A BIBLIOTECA/PACOTE

options(scipen = 999) # AJUSTA A NOT. CIENT.

# DADOS EM PAINEL
dadospib <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD')
# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD',
                    start = 2023, end = 2023)
# SÉRIE TEMPORAL
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')


#FAZER GRÁFICOS
#biblioteca mais importante p/fazer gráficos: ggplot2 
#que faz parte do pacote tidyverse

#PASSO 1
#install.packages("tidyverse")
library(tidyverse)

#PASSO 2 
#a)DADOS EM PAINEL
grafpainel <- ggplot(dadospib,
                     mapping = aes(x= year,
                                   y= NY.GDP.MKTP.CD)) +
  geom_point()

print(grafpainel)


#b)CORTE TRANSVERSAL
grafcorte <- ggplot(dadospib2023,
                     mapping = aes(x= year,
                                   y= NY.GDP.MKTP.CD)) +
  geom_point()

print(grafcorte)


#c)SÉRIE TEMPORAL
grafserie <- ggplot(dadospibbr,
                    mapping = aes(x= year,
                                  y= NY.GDP.MKTP.CD)) +
  geom_line()

print(grafserie)