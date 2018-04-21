rm(list=ls())

#set work directory path
setwd("directory path")

#predict price using 'toyota' dataset
rawdata <- read.csv('toyota.csv', header = TRUE, na.strings="")
rawdata <- subset(rawdata, select = c(Price,Age_08_04,KM,Fuel_Type,HP,Color))

#catergorize cars with their Fuel Types
unique_type <- unique(rawdata$Fuel_Type)

#create dummy dataframe
type_dummy = as.data.frame(matrix(0,nrow(rawdata), length(unique_type)))

#read toyota dataset's Fuel Type and write into dummy dataframe
for(i in 1:(length(unique_type))){

	tmp = unique_type[i]
	tmp_idx = which(rawdata$Fuel_Type == tmp)
	type_dummy[tmp_idx,i] = 1
	colnames(type_dummy)[i] = sprintf("type_%s",tmp)

}
