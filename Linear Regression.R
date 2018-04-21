rm(list=ls())

#set work directory path
setwd("directory path")

#predict price using 'toyota' dataset
rawdata <- read.csv('toyota.csv', header = TRUE, na.strings="")
rawdata <- subset(rawdata, select = c(Price,Age_08_04,KM,Fuel_Type,HP,Color))

#catergorize cars with their Fuel Types
unique_type <- unique(rawdata$Fuel_Type)
