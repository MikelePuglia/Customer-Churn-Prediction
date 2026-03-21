set.seed(1)
idx <- createDataPartition(bank$churn, p=0.7)
train <- bank[idx$Resample1,]
test <- bank[-idx$Resample1,]

dim(train)
dim(test)
