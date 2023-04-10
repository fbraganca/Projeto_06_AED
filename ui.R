# ui.R
library(tidyverse)
library(dlookr)
library(ggplot2)
library(dplyr)
library(mice)
library(shinydashboard)
library(colourpicker)

ui = fluidPage(

  titlePanel("Projeto Análise Exploratória de Dados"),

  dashboardSidebar(
    sidebarPanel(

      varSelectInput("sistema", h4("Escolha o sistema:"), bd.mes[2:5]),

      selectInput("color", h4("Escolha a Cor da linha:"),
                  c("Verde" = "green",
                    "Ciano" = "cyan3",
                    "Azul" = "blue",
                    "Vermelho" = "red",
                    "Laranja" = "orange")),


      sliderInput("mes", label = h4("Selecione os meses:"), min = min(bd.mes$mes),
                  max = max(bd.mes$mes), value = c(min(bd.mes$mes), max(bd.mes$mes)),1),

      sliderInput("reset", label = h4("Selecione o número de resets:"), min = min(bd.mes[2:5]),
                  max = max(bd.mes[2:5]), value = c(min(bd.mes[2:5]), max(bd.mes[2:5])),10),

    )),



  mainPanel(

    plotOutput("resultado"),

    h4("Dados coletados de um projeto de boas práticas para ensinar aos colaboradores um melhor método de criação de senhas e posterior diminuição dos pedidos de reset de senha."),

  ))
