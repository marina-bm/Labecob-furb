#REFAZER O PROCESSO DA AULA 05 COM UMA NOVA VARIÁVEL



#VARIÁVEL 1: ADOLESCENTES FORA DA ESCOLA
options(scipen = 999)

#dados em painel
infoAE <- WDI(country = 'all',
              indicator = 'SE.SEC.UNER.LO.ZS')

#corte transversal
infoAE2023 <- WDI(country = 'all',
                  indicator = 'SE.SEC.UNER.LO.ZS',
                  start = 2023, end = 2023)

#serie temporal
infoAEeua <- WDI(country = 'US',
                 indicator = 'SE.SEC.UNER.LO.ZS')



#VARIÁVEL 2: FOOD EXPORTS
options(scipen = 999)

#dados em painel
infoFE <- WDI(country = 'all',
              indicator = 'TX.VAL.FOOD.ZS.UN')

#corte transversal
infoFE2020 <- WDI(country = 'all',
                  indicator = 'TX.VAL.FOOD.ZS.UN',
                  start = 2020, end = 2020)

#serie temporal
infoFEbr <- WDI(country = 'BR',
                indicator = 'TX.VAL.FOOD.ZS.UN')