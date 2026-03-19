# ============================================
# 04_model_glm.R
# ============================================
# Function: train_glm()
# Description:
#   Trains a binary GLM model using logit link
# Input:
#   df - dataset
#   formula - R formula (default churn ~ .)
# Output:
#   glm object
# ============================================

train_glm <- function(df, formula = NULL) {
  if(is.null(formula)) formula <- churn ~ .
  
  model <- glm(formula = formula, data = df, family = binomial(link="logit"))
  cat("✅ GLM model trained\n")
  return(model)
}
