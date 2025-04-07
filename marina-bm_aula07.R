#USANDO CHATGPT PARA MODIFICAR O GRÁFICO GERADO NA AULA PASSADA

#COMANDO NO CHATGPT
#Usando a biblioteca WDI, coletam-se estes dados (em painel):
#dadospib <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD')

#Estruturou-se este gráfico simples:
#  grafpainel <- ggplot(data = dadospib,
                       mapping = aes(y = NY.GDP.MKTP.CD,
                                     x = year)) +
#  geom_point()

#Como fazer um gráfico mais moderno, incluindo:
#1) Adicione um título ao gráfico
#2) Renomeie o eixo y como PIB
#3) Renomeie o eixo x como Ano
#4) Utilize cores modernas
#5) Coloque os dados do Brasil em vermelho
                  
  
#RESULTADO CHATGPT
                  # Criar uma coluna para identificar o Brasil
                  dadospib <- dadospib %>%
                    mutate(Brasil = ifelse(country == "Brazil", "Brasil", "Outro"))
                  
                  # Gráfico moderno
                  graf_pib_moderno <- ggplot(dadospib, aes(x = year, 
                                                           y = NY.GDP.MKTP.CD, 
                                                           color = Brasil)) +
                    geom_line(alpha = 0.6, aes(group = country), show.legend = FALSE) +
                    geom_line(data = filter(dadospib, country == "Brazil"), 
                              color = "red", size = 1.2) +  # Brasil em vermelho
                    scale_color_manual(values = c("Outro" = "#a6bddb", "Brasil" = "red")) +
                    labs(title = "PIB Mundial ao Longo do Tempo",
                         x = "Ano",
                         y = "PIB (US$ Correntes)",
                         caption = "Fonte: Banco Mundial via WDI") +
                    theme_minimal(base_size = 14) +
                    theme(plot.title = element_text(face = "bold"),
                          axis.title = element_text(face = "bold"))
                  
                  print(graf_pib_moderno)
                  
                  
                  # Criar uma coluna para identificar o Brasil
                  dadospib <- dadospib %>%
                    mutate(Brasil = ifelse(country == "Brazil", "Brasil", "Outro"))
                  
                  # Gráfico moderno
                  graf_pib_moderno <- ggplot(dadospib, aes(x = year, 
                                                           y = NY.GDP.MKTP.CD, 
                                                           color = Brasil)) +
                    geom_line(alpha = 0.6, aes(group = country), show.legend = FALSE) +
                    geom_line(data = filter(dadospib, country == "Brazil"), 
                              color = "red", size = 1.2) +  # Brasil em vermelho
                    scale_color_manual(values = c("Outro" = "#a6bddb", "Brasil" = "red")) +
                    labs(title = "PIB Mundial ao Longo do Tempo",
                         x = "Ano",
                         y = "PIB (US$ Correntes)",
                         caption = "Fonte: Banco Mundial via WDI") +
                    theme_minimal(base_line_size =  = 14) +
                    theme(plot.title = element_text(face = "bold"),
                          axis.title = element_text(face = "bold"))
                  
                  print(graf_pib_moderno)
                  