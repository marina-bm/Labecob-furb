library(WDI)
options(scipen = 999)
library(tidyverse)




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




#3.MELHORAR GRPAFICOS COM CHATGPT
#DADOS EM PAINÉL: destaque pra dados do US e BR
library(WDI)
library(ggplot2)
library(dplyr)

# Coletando os dados
dados_eletric <- WDI(country = 'all', indicator = 'EG.ELC.ACCS.ZS')

# Filtrando apenas os países BR e US
dados_filtrados <- dados_eletric %>%
  filter(iso2c %in% c("US", "BR"))

# Criando o gráfico moderno
grafpainel_el <- ggplot(dados_filtrados, aes(x = year, y = EG.ELC.ACCS.ZS, color = iso2c)) +
  geom_point(size = 2, alpha = 0.7) +
  scale_color_manual(values = c("BR" = "green", "US" = "blue"),
                     labels = c("BR" = "Brasil", "US" = "Estados Unidos"),
                     name = "País") +
  labs(
    x = "Ano",
    y = "Access Eletricity",
    title = "Acesso à Eletricidade (%) - BR vs US"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "bottom"
  )

# Exibindo o gráfico
print(grafpainel_el)




#CORTE TRANSVERSAL:DADOS 1990
#
dados_eletric_1990 <- WDI(country = 'all',
                          indicator = 'EG.ELC.ACCS.ZS',
                          start = 1990, end = 1990)
#
grafcorte_el1990 <- ggplot(dados_eletric_1990,
                       mapping = aes(x= year,
                                     y= EG.ELC.ACCS.ZS)) +
  geom_point()
print(grafcorte_el1990)
#
library(WDI)
library(ggplot2)

# Coletando os dados de 1990
dados_eletric_1990 <- WDI(country = 'all',
                          indicator = 'EG.ELC.ACCS.ZS',
                          start = 1990, end = 1990)

# Gráfico moderno com eixos renomeados
grafcorte_el1990 <- ggplot(dados_eletric_1990, aes(x = year, y = EG.ELC.ACCS.ZS)) +
  geom_point(size = 3, alpha = 0.7, color = "steelblue") +
  labs(
    x = "Ano",
    y = "Access Eletricity",
    title = "Acesso à Eletricidade - Ano 1990"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12)
  )

# Exibir o gráfico
print(grafcorte_el1990)



#CORTE TRANSVERSAL: ANOS 2000
#
dados_eletric_2000 <- WDI(country = 'all',
                          indicator = 'EG.ELC.ACCS.ZS',
                          start = 2000, end = 2000)
#
grafcorte_el2000 <- ggplot(dados_eletric_2000,
                           mapping = aes(x= year,
                                         y= EG.ELC.ACCS.ZS)) +
  geom_point()
print(grafcorte_el2000)
#
library(WDI)
library(ggplot2)

# Coletando os dados de 2000
dados_eletric_2000 <- WDI(country = 'all',
                          indicator = 'EG.ELC.ACCS.ZS',
                          start = 2000, end = 2000)

# Gráfico moderno com nomes ajustados
grafcorte_el2000 <- ggplot(dados_eletric_2000, aes(x = year, y = EG.ELC.ACCS.ZS)) +
  geom_point(size = 3, alpha = 0.7, color = "steelblue") +
  labs(
    x = "Ano",
    y = "Access Eletricity",
    title = "Acesso à Eletricidade - Ano 2000"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text = element_text(size = 10)
  )

# Exibir o gráfico
print(grafcorte_el2000)




#SÉRIE TEMPORAL: BRASIL - CORES VERDE, AMARELO E AZUL NO TÍTULO - DESTQUE
#ANOS 1990, 2000 E 2020
#
install.packages("ggtext")
library(ggtext)
#
library(WDI)
library(ggplot2)
library(dplyr)
library(ggtext)  # Pacote para texto com cores no título

# Coletando os dados de acesso à eletricidade para o Brasil
dados_eletric_BR <- WDI(country = 'BR',
                        indicator = 'EG.ELC.ACCS.ZS')

# Criando coluna de cores: verde para anos específicos, cinza claro para os demais
dados_eletric_BR <- dados_eletric_BR %>%
  mutate(cor = ifelse(year %in% c(1990, 2000, 2020), "forestgreen", "gray85"))

# Gráfico de barras estilizado
grafseriee_el <- ggplot(dados_eletric_BR, aes(x = year, y = EG.ELC.ACCS.ZS, fill = cor)) +
  geom_col() +
  scale_fill_identity() +
  labs(
    x = "Ano",
    y = "Access Eletricity",
    title = paste0(
      "Acesso à Eletricidade no ",
      "<span style='color:forestgreen;'>B</span>",
      "<span style='color:gold;'>r</span>",
      "<span style='color:dodgerblue;'>a</span>",
      "<span style='color:forestgreen;'>s</span>",
      "<span style='color:gold;'>i</span>",
      "<span style='color:dodgerblue;'>l</span>"
    )
  ) +
  theme_minimal() +
  theme(
    plot.title = element_markdown(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text = element_text(size = 10)
  )

# Exibindo o gráfico
print(grafseriee_el)




#CONTEÚDO PRO SITE
#1 
#A variável "acesso à eletricidade" mede a proporção da população de um país,
#região ou área que tem disponibilidade de eletricidade em casa, de maneira 
#confiável e contínua. Geralmente, ela é expressa em percentual (%) — por exemplo,
#se um país tem 98% de acesso à eletricidade, isso significa que 98% da população 
#vive em locais onde a energia elétrica está disponível para uso doméstico, 
#comercial ou público.Esse dado é considerado um dos indicadores básicos de 
#desenvolvimento, já que a energia impacta diretamente áreas essenciais da vida,
#como a saúde, a educação e a qualidade de vida.


#2
# De acordo com os gráficos analisados, observa-se que, durante um longo período, 
#existiu uma diferença significativa entre os dados de acesso à eletricidade dos 
#Estados Unidos e do Brasil. Essa diferença está diretamente relacionada às 
#trajetórias históricas de desenvolvimento de cada país.

#Nos Estados Unidos, os processos de industrialização e urbanização ocorreram de 
#maneira acelerada a partir do final do século XIX e início do século XX. Esse
#avanço impulsionou a rápida expansão da rede elétrica, alcançando a maior parte 
#do território nacional já nas primeiras décadas do século XX. Como resultado, o 
#acesso à eletricidade tornou-se praticamente universal no país ainda na metade 
#do século passado.

#Em contraste, o Brasil experimentou uma industrialização mais tardia, marcada por
#profundas desigualdades regionais e sociais. Esses fatores dificultaram a expansão
#da eletrificação, especialmente em áreas rurais e regiões remotas, como o Norte e 
#o Nordeste. No Brasil, o processo de universalização do acesso à eletricidade 
#ganhou maior força apenas a partir dos anos 1990 e 2000, com a implementação de
#programas governamentais como o "Luz para Todos", que teve como objetivo levar 
#energia elétrica a populações historicamente excluídas desse serviço.


#3
#A grande diferença na quantidade de dados e nos valores de acesso à eletricidade 
#no mundo entre 1990 e 2000 pode ser explicada por dois fatores principais.

#O primeiro é que, em 1990, muitos países — especialmente os em desenvolvimento—
#ainda não tinham sistemas bem organizados para coletar informações sobre 
#eletrificação. Mesmo onde já existia energia elétrica, muitas vezes não havia 
#registros oficiais ou dados atualizados. Com o avanço da tecnologia da informação 
#e da comunicação, e também com a melhoria dos sistemas estatísticos (como censos e
#pesquisas domiciliares), os anos 2000 trouxeram dados muito mais completos e 
#confiáveis. Além disso, instituições como o Banco Mundial e a ONU começaram a 
#exigir mais transparência e padronização nas informações.

#O segundo motivo é o crescimento real do acesso à eletricidade. Durante a década
#de 1990, muitos países investiram pesado em levar energia para áreas rurais e 
#comunidades afastadas, principalmente na Ásia, na África e na América Latina. 
#Exemplos como China, Índia, Brasil e vários países africanos mostram esse esforço.
#Com isso, o número de pessoas com acesso à eletricidade aumentou bastante entre 
#1990 e 2000.


#4
#A diferença nos dados de acesso à eletricidade no Brasil entre 1990, 2000 e 2020
#pode ser explicada por uma combinação de fatores, incluindo a expansão da 
#infraestrutura elétrica, políticas públicas focadas na inclusão e avanços na 
#coleta de dados. Em 1990, aproximadamente 30 milhões de brasileiros (cerca de 
#17% da população) não tinham acesso à eletricidade, especialmente em áreas rurais 
#e nas regiões Norte e Nordeste. A maior parte dessa população vivia em locais 
#remotos, onde a distribuição de energia era inviável ou muito cara. A partir dos
#anos 2000, o programa Luz para Todos, lançado em 2003 pelo governo federal  
#brasileiro, foi fundamental para diminuir essa disparidade. O programa foi 
#responsável por levar energia elétrica a mais de 15 milhões de pessoas, com 
#investimentos em infraestrutura de redes elétricas em localidades remotas, 
#muitas das quais jamais haviam sido atendidas. Além disso, a Eletrobras e outras
#empresas de distribuição trabalharam em parceria com as prefeituras e governos 
#estaduais para levar a eletrificação a comunidades isoladas. Nos anos 2010, 
#também houve um significativo avanço tecnológico na coleta de dados, com o IBGE 
#e outras agências implementando censos mais detalhados, permitindo uma mensuração
#mais precisa do acesso à eletricidade em áreas urbanas e rurais. Esse progresso 
#foi crucial para que, em 2020, o Brasil alcançasse 98,6% de cobertura elétrica, 
#destacando a universalização do serviço e refletindo a redução das desigualdades
#regionais e sociais ao longo dessas décadas.