# global.R
library(tidyverse)
library(dlookr)
library(ggplot2)
library(dplyr)
library(mice)
library(shinydashboard)
library(colourpicker)

bd <- data.frame(read.csv2("Reset_Sistemas_2005.csv"))

imputed <- mice(bd,m=5,maxit=50,meth='pmm',seed=500)
imp1 <- complete(imputed,1); imp2 <- complete(imputed,2)
imp3 <- complete(imputed,3); imp4 <- complete(imputed,4); imp5 <- complete(imputed,5)


bd.mes = data.frame(
  mes = bd$mes,
  rede = bd$rede,
  email = bd$email,
  netrac = cbind(imp1$netrac,imp2$Porte,imp3$Porte,imp4$Porte,imp5$Porte),
  sisac = bd$sisac)

rm(imp1,imp2,imp3,imp4,imp5)

bd.mes <- data.frame(group_by(bd.mes, mes) %>%
                          dplyr::summarize(rede = sum(rede), email = sum(email), netrac = sum(netrac), sisac = sum(sisac)))


