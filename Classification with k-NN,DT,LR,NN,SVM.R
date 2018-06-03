## clear workspace
rm(list=ls())

## set workspace
setwd("/Users/joh/Desktop")

## bring data table
rawdata = read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data", sep = ",")

## set column names
colnames(rawdata) = c("gender", "length", "diameter", "height", "whole_weight", "shucked_weight", "viscera_weight", "shell_weight", "ring")

## gender is set M, F, I however numbers are more generous so will change those values into numbers
## unique variable
unique_gender = unique(rawdata$gender)

## matrix for storing changed target 
new_gender = matrix(0,nrow(rawdata),1)

## loop to change M, F, I values into numbers
for(i in 1:length(unique_gender)){
	tmp_idx = which(rawdata$gender == unique_gender[i])
	new_gender[tmp_idx] = i
}

## delete old gender variable
rawdata = rawdata[,-1]

## Min_Max scale for all of the variables
for(i in 1:ncol(rawdata)){
	rawdata[,i] = (rawdata[,i] - min(rawdata[,i])) / (max(rawdata[,i]) - min(rawdata[,i]))
}

## combine scaled raw data and number changed target
prdata = cbind(rawdata, new_gender)

tmp_idx = union(which(prdata$new_gender == 1), which(prdata$new_gender == 2))
prdata = prdata[tmp_idx,]
prdata$new_gender[which(prdata$new_gender == 2)] = 0
prdata$new_gender = as.factor(prdata$new_gender)


