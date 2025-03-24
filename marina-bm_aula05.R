#API (FORMA DE ACESSO) 
#DADOS DO BANCO MUNDIAL (WORLD BANK)
#WORLD DEVELOPMENT INDICATORS (BASE DE DADOS)

#NA AULA PASSADA, ACESSAMOS OS DADOS DO PIB(PRODUTO INTERNO BRUTO)

#PRA COMEÇAR TEM QUE CARREGAR A BIBLIOTECA
library(WDI)

options(scipen = 999)


#DADOS EM PAINEL
dadospib <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD')
#NESSE CASO WDI É O INDICADOR DO QUE QUEREMOS ACHAR


#CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD',
                    start = 2023, end = 2023)

#COMO FAZER 'SÉRIE TEMPORAL'?
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')