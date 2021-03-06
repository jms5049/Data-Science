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

rawdata <- rawdata[c(4,2,3,1,5,6)]
prdata = rawdata[,-1]
prdata = cbind(type_dummy,prdata)

#data partition

trn_ratio = 0.7
trn_idx = sample(1:nrow(prdata), round(trn_ratio * nrow(prdata)))
tst_idx = setdiff(1:nrow(prdata), trn_idx)

trn_data = prdata[trn_idx,]
tst_data = prdata[tst_idx,]

#linear regression

fit_lr = lm(Price ~ ., data=trn_data)
fit_lr
summary(fit_lr)
pred_lr = predict(fit_lr, tst_data)

mse_lr = mean((tst_data$Price-pred_lr)^2)

#Step Wise

step_lr = step(fit_lr, direction = "both")
summary(step_lr)
pred_step = predict(step_lr, tst_data)

mse_step = mean((tst_data$Price-pred_step)^2)

# Plot both and Compare

par(mfrow = c(1,2))
plot(tst_data$Price, pred_lr)
plot(tst_data$Price, pred_step)
