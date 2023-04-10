# server.R
library(tidyverse)
library(dlookr)
library(ggplot2)
library(dplyr)
library(mice)
library(shinydashboard)
library(colourpicker)

server = function(input, output, session) {

  output$resultado <- renderPlot({
    ggplot(bd.mes, aes(x=mes, y=!!input$sistema, group=1)) + xlim(input$mes)+ylim(input$reset) + geom_line(color=input$color)+geom_point()



  })

}

