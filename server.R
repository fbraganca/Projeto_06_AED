# server.R
library(tidyverse)
library(dlookr)
library(ggplot2)
library(dplyr)
library(mice)
library(shinydashboard)
library(colourpicker)

server = function(input, output, session) {

  observeEvent(input$sistema, {
    a = paste0(input$sistema)

    updateSliderInput(inputId = "reset", min = min(bd.mes[a]), max = max(bd.mes[a]), value = c(min(bd.mes[a]), max(bd.mes[a])))
    output$resultado <- renderPlot({
      ggplot(bd.mes, aes(x=mes, y=!!input$sistema, group=1)) + xlim(input$mes)+ylim(input$reset) + geom_line(color=input$color)+geom_point()

                                  })
              })

}

