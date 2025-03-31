#1.DADOS 'ACCESS TO ELETRICITY'

#dados em painel
dados_eletric <- WDI(country = 'all',
              indicator = 'EG.ELC.ACCS.ZS')

#corte transversal
dados_eletric_2020 <- WDI(country = 'all',
                  indicator = 'EG.ELC.ACCS.ZS',
                  start = 2020, end = 2020)

#serie temporal
dados_eletric_BR <- WDI(country = 'BR',
                 indicator = 'EG.ELC.ACCS.ZS')


#2.FAZER GRÁFICOS

#a)Grafico em painel
grafpainel_el <- ggplot(dados_eletric,
                        mapping = aes(x=year,
                                      y= EG.ELC.ACCS.ZS)) +
  geom_point()

print(grafpainel_el)


#b)Corte transversal
grafcorte_el <- ggplot(dados_eletric_2020,
                     mapping = aes(x= year,
                                   y= EG.ELC.ACCS.ZS)) +
  geom_point()

print(grafcorte_el)


#c)Série Temporal
grafseriee_el <- ggplot(dados_eletric_BR,
                       mapping = aes(x= year,
                                     y= EG.ELC.ACCS.ZS)) +
  geom_line()

print(grafseriee_el)