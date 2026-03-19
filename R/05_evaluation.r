# ============================================
# 05_evaluation.R
# ============================================
# Function: evaluate_model()
# Description:
#   Evaluates a GLM model:
#     - Confusion matrix
#     - Accuracy
#     - ROC and AUC
# Input:
#   model - trained glm object
#   df - dataset for evaluation
#   threshold - cutoff probability for prediction (default 0.5)
# Output:
#   Prints metrics and returns list with confusion matrix and accuracy
# ============================================

evaluate_model <- function(model, df, threshold=0.5) {
  
  # Predict probabilities
  probs <- predict(model, df, type="response")
  preds <- ifelse(probs > threshold, 1, 0)
  
  # Confusion matrix
  cm <- table(Predicted = preds, Actual = df$churn)
  cat("=== Confusion Matrix ===\n")
  print(cm)
  
  # Accuracy
  accuracy <- sum(diag(cm))/sum(cm)
  cat("Accuracy:", round(accuracy,3), "\n")
  
  # ROC and AUC
  if(requireNamespace("pROC", quietly = TRUE)) {
    library(pROC)
    roc_obj <- roc(df$churn, probs)
    auc_val <- auc(roc_obj)
    cat("AUC:", round(auc_val,3), "\n")
    plot(roc_obj, col="blue", main="ROC Curve")
  }
  
  return(list(conf_matrix = cm, accuracy = accuracy))
}
