# Accuracy
prob <- predict(bank.fit2, train, type='response') 
train_matrix <- table(train$churn, as.numeric(prob>0.5))
train_accuracy <- sum(diag(train_matrix))/sum(train_matrix)
print(train_accuracy)

prob <- predict(bank.fit2, test, type='response')
test_matrix <- table(test$churn, as.numeric(prob>0.5))
test_accuracy <- sum(diag(test_matrix))/sum(test_matrix)
print(test_accuracy)

# ROC-AUC
M <- predict(bank.fit2, test, type="response")
MA <- prediction(M, test$churn)
perf <- performance(MA, "tpr", "fpr")
plot(perf, colorize=TRUE)
axis(1, at=seq(0,1,0.1), tck=1, lty=2, col="grey", labels=NA)
axis(2, at=seq(0,1,0.1), tck=1, lty=2, col="grey", labels=NA)
abline(a=0, b=1)
auc(test$churn,M)

# Precision, Recall, F1
train_precision <- train_matrix[2,2] / sum(train_matrix[,2])
train_recall <- train_matrix[2,2] / sum(train_matrix[2,])
train_f1 <- 2 * (train_precision * train_recall)/(train_precision + train_recall)
cat("Train Precision:", train_precision,"\n")
cat("Train Recall:", train_recall,"\n")
cat("Train F1:", train_f1,"\n")

test_precision <- test_matrix[2,2] / sum(test_matrix[,2])
test_recall <- test_matrix[2,2] / sum(test_matrix[2,])
test_f1 <- 2 * (test_precision*test_recall)/(test_precision+test_recall)
cat("Test Precision:", test_precision,"\n")
cat("Test Recall:", test_recall,"\n")
cat("Test F1:", test_f1,"\n")

# Confusion matrix
pred2 <- predict(bank.fit2, test, type="response")
cutoff_churn <- ifelse(pred2>=0.50,1,0)
cm <- confusionMatrix(as.factor(test$churn), as.factor(cutoff_churn), positive='1')
cm
prob <- predict(bank.fit2, test, type='response')
conf_matrix <- table(test$churn, as.numeric(prob>0.5))
conf_matrix_percent <- round(prop.table(conf_matrix, margin=1)*100,1)
print(conf_matrix_percent)
