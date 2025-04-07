#USEM IA PARA CRIAR GRÁFICOS MELHORES
#vou fazer baseado nos dados de eletricidade da atividade_06


#GRÁFICO 1:DADOS EM PAINÉL
#A)COMANDO CHAT
#Usando a biblioteca WDI, coletam-se estes dados (em painel):
#  dados_eletric <- WDI(country = 'all',
                       indicator = 'EG.ELC.ACCS.ZS')
  
#  Estruturou-se este gráfico simples:
#    grafpainel_el <- ggplot(dados_eletric,
                            mapping = aes(x=year,
                                          y= EG.ELC.ACCS.ZS)) +
    geom_point()
  
#  Como fazer um gráfico mais moderno, incluindo:
a)Renomeie o eixo x como "Ano"
b)Renomeie o eixo y como "Access Eletricity"
c)Coloque os dados no eixo x, do ano de 2000 até 2005, na cor rosa

#B)RESULTADO CHAT
# Carregar pacotes
library(WDI)
library(ggplot2)
library(dplyr)

# Baixar dados
dados_eletric <- WDI(country = 'all',
                     indicator = 'EG.ELC.ACCS.ZS',
                     extra = TRUE)

# Filtrar apenas países
dados_eletric <- dados_eletric %>%
  filter(region != "Aggregates")

# Criar uma coluna para destacar os anos de 2000 a 2005
dados_eletric <- dados_eletric %>%
  mutate(destacar = ifelse(year >= 2000 & year <= 2005, "2000-2005", "Outros"))

# Gráfico moderno com destaque
grafpainel_el <- ggplot(dados_eletric,
                        aes(x = year, y = EG.ELC.ACCS.ZS)) +
  geom_point(aes(color = destacar), alpha = 0.7) +
  scale_color_manual(values = c("2000-2005" = "deeppink", "Outros" = "gray70")) +
  labs(title = "Acesso à Eletricidade (% da População)",
       x = "Ano",
       y = "Access Electricity",
       color = "Período") +
  theme_minimal(base_size = 14)

print(grafpainel_el)



#GRÁFICO 2: CORTE TRANSVERSAL
#A)COMANDO CHAT
#Usando a biblioteca WDI, coletam-se estes dados (corte transversal):
#  dados_eletric_2020 <- WDI(country = 'all',
                            indicator = 'EG.ELC.ACCS.ZS',
                            start = 2020, end = 2020)

#Estruturou-se este gráfico simples:
  grafcorte_el <- ggplot(dados_eletric_2020,
                         mapping = aes(x= year,
                                       y= EG.ELC.ACCS.ZS)) +
  geom_point()

#Como fazer um gráfico mais moderno, incluindo:
#a)Renomeie o eixo x como "Ano"
#b)Renomeie o eixo y como "Access Eletricity"
#c)Coloque os dados no eixo x, dos países Brasil, na cor roxo

#B)RESULTADO CHAT
# Carregar pacotes
library(WDI)
library(ggplot2)
library(dplyr)

# Baixar dados do acesso à eletricidade em 2020
dados_eletric_2020 <- WDI(country = 'all',
                          indicator = 'EG.ELC.ACCS.ZS',
                          start = 2020, end = 2020,
                          extra = TRUE)

# Filtrar apenas países (exclui regiões agregadas)
dados_eletric_2020 <- dados_eletric_2020 %>%
  filter(region != "Aggregates")

# Criar uma coluna para destacar o Brasil
dados_eletric_2020 <- dados_eletric_2020 %>%
  mutate(destacar = ifelse(country == "Brazil", "Brasil", "Outros"))

# Gráfico moderno
grafcorte_el <- ggplot(dados_eletric_2020,
                       aes(x = year,
                           y = EG.ELC.ACCS.ZS,
                           color = destacar)) +
  geom_point(size = 2.5, alpha = 0.7) +
  scale_color_manual(values = c("Brasil" = "purple", "Outros" = "gray70")) +
  labs(title = "Acesso à Eletricidade em 2020",
       x = "Ano",
       y = "Access Electricity",
       color = "País") +
  theme_minimal(base_size = 14)

print(grafcorte_el)



#GRÁFICO 3: SÉRIE TRANSVERSAL
#A)COMANDO CHAT
#Usando a biblioteca WDI, coletam-se estes dados (série temporal):
#dados_eletric_BR <- WDI(country = 'BR',
                          indicator = 'EG.ELC.ACCS.ZS')

#Estruturou-se este gráfico simples:
  grafseriee_el <- ggplot(dados_eletric_BR,
                          mapping = aes(x= year,
                                        y= EG.ELC.ACCS.ZS)) +
  geom_line()

#Como fazer um gráfico mais moderno, incluindo:
#a)Renomeie o eixo x como "Ano"
#b)Renomeie o eixo y como "Access Eletricity"
#c)Estruture o gráfico em formato de barras
#d)intercale as cores das barras em rosa e roxo

#B)RESULTADO CHAT
# Carregar pacotes
library(WDI)
library(ggplot2)
library(dplyr)

# Baixar dados de acesso à eletricidade para o Brasil (série temporal)
dados_eletric_BR <- WDI(country = 'BR',
                        indicator = 'EG.ELC.ACCS.ZS')

# Criar coluna para alternar as cores (par/ímpar ou outro padrão)
dados_eletric_BR <- dados_eletric_BR %>%
  arrange(year) %>%
  mutate(cor = rep(c("rosa", "roxo"), length.out = n()))

# Definir cores desejadas
cores_personalizadas <- c("rosa" = "deeppink", "roxo" = "purple")

# Gráfico moderno em barras
grafseriee_el <- ggplot(dados_eletric_BR,
                        aes(x = factor(year),  # transforma ano em fator para barras ordenadas
                            y = EG.ELC.ACCS.ZS,
                            fill = cor)) +
  geom_col() +
  scale_fill_manual(values = cores_personalizadas) +
  labs(title = "Acesso à Eletricidade no Brasil",
       x = "Ano",
       y = "Access Electricity",
       fill = "") +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(grafseriee_el)


#A)COMANDO CHAT


#B)RESULTADO CHAT
# Carregar pacotes
library(WDI)
library(ggplot2)
library(dplyr)

# Baixar dados da série temporal para o Brasil
dados_eletric_BR <- WDI(country = 'BR',
                        indicator = 'EG.ELC.ACCS.ZS')

# Criar coluna para intercalar as cores (ex: azul, roxo)
dados_eletric_BR <- dados_eletric_BR %>%
  arrange(year) %>%
  mutate(cor = rep(c("azul", "roxo"), length.out = n()))

# Definir cores personalizadas
cores_personalizadas <- c("azul" = "dodgerblue", "roxo" = "purple")

# Criar coluna com apenas os dois últimos dígitos do ano
dados_eletric_BR <- dados_eletric_BR %>%
  mutate(ano_curto = substr(as.character(year), 3, 4))

# Gráfico moderno em barras
grafseriee_el <- ggplot(dados_eletric_BR,
                        aes(x = ano_curto,
                            y = EG.ELC.ACCS.ZS,
                            fill = cor)) +
  geom_col() +
  scale_fill_manual(values = cores_personalizadas) +
  labs(title = "Acesso à Eletricidade no Brasil",
       x = "Ano",
       y = "Access Electricity",
       fill = "") +
  theme_minimal(base_size = 14)

print(grafseriee_el)

